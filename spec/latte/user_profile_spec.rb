# frozen_string_literal: true

require 'spec_helper'
require 'latte'

describe Latte::UserProfile do
  # This is the HTML of https://www.codementor.io/@kristianskuhta
  let(:profile) do
    Latte::UserProfile.new("file://#{File.absolute_path("#{File.dirname(__FILE__)}/../fixtures/sample01.html")}")
  end

  describe '.get_profile' do
    it 'creates an new instance of Latte::UserProfile' do
      expect(profile).to be_instance_of Latte::UserProfile
    end
  end

  describe '#first_name' do
    it "returns profile's first name" do
      expect(profile.first_name).to eq 'Kristians'
    end
  end

  describe '#last_name' do
    it "returns profile's last name" do
      expect(profile.last_name).to eq 'Kuhta'
    end
  end

  describe '#about' do
    it "returns profile's about me" do
      expected_about_me = "Passionate full-stack Ruby on Rails developer with 5 years of experience.\nStrong background in the development of internal systems that allow businesses to orient their operations around digital documents rather than physical ones.\nI have 5 years of experience in Ruby on Rails, JavaScript, PostgreSQL.\nI specialise in enterprise-level Code Reviews and Integration testing.\nAs well as I have worked with technologies like:\n\nTest-driven development\nRSpec testing framework\nCapybara feature testing framework\nJest\nREST APIs\nRedis database\nDocker\njQuery\nStimulusJS\nTurbo.js, Hotwire\nReact\n\n"
      expect(profile.about).to eq expected_about_me
    end
  end

  describe '#languages' do
    it "returns profile's languages" do
      expect(profile.languages).to eq %w[Latvian English]
    end
  end

  describe '#timezone' do
    it "returns profile's timezone" do
      expect(profile.timezone).to eq 'Riga (+03:00)'
    end
  end

  describe '#expertises' do
    it "returns profile's expertises" do
      expected_expertises = [
        { name: 'Ruby on Rails' },
        { name: 'Ruby' },
        { name: 'JavaScript' },
        { name: 'Solidity' },
        { name: 'Ethereum' },
        { name: 'Web3js' },
        { name: 'RSpec' }
      ]
      expect(profile.expertises).to eq expected_expertises
    end
  end
end
