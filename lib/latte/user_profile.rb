# frozen_string_literal: true

module Latte
  class UserProfile
    ATTRIBUTES = %w[
      first_name
      last_name
      about
      languages
      timezone
      expertises
    ].freeze

    attr_reader :page, :code_mentor_url

    def initialize(url, options = {})
      @code_mentor_url = url
      @options = options
      @page = http_client.get(url)
    end

    def first_name
      @first_name ||= @page.at('//*[@id="__next"]/div[2]/div[2]/div[1]/div[2]/div/section[1]/div[1]/div[2]/h1').text.split(
        ' ', 2
      )[0].strip
    end

    def last_name
      @last_name ||= @page.at('//*[@id="__next"]/div[2]/div[2]/div[1]/div[2]/div/section[1]/div[1]/div[2]/h1').text.split(
        ' ', 2
      )[1].strip
    end

    def about
      @about ||= @page.at('.about').text
    end

    def languages
      @languages ||= @page.at('.languages')&.text&.split(',')&.map(&:strip)
    end

    def timezone
      @timezone ||= @page.at('.timezone').text
    end

    def expertises
      @expertises ||= @page.at('/html/body/div/div[2]/div[2]/div[2]/div/section[2]').search('.name').map do |expertise|
        {
          name: expertise.text
        }
      end
    end

    def to_json(*_args)
      require 'json'
      ATTRIBUTES.each_with_object({}) do |attr, hash|
        hash[attr.to_sym] = send(attr.to_sym)
      end.to_json
    end

    private

    def http_client
      @http_client ||= Mechanize.new do |agent|
        agent.user_agent = Latte::UserAgent.randomize
        unless @options.empty?
          agent.set_proxy(@options[:proxy_ip], @options[:proxy_port], @options[:username], @options[:password])
          agent.open_timeout = @options[:open_timeout]
          agent.read_timeout = @options[:read_timeout]
        end
        agent.max_history = 0
      end
    end
  end
end
