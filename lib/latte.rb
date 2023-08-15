# frozen_string_literal: true

require 'rubygems'
require 'mechanize'
require 'cgi'
require 'net/http'

Dir["#{__dir__}/latte/*.rb"].sort.each { |file| require file }
