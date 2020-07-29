require 'httparty'


require "geopath/version"
require 'geopath/configuration'


module Geopath
  class Error < StandardError; end

  class << self 
    attr_accessor :config
  end

  def self.configuration
    self.config ||= Configuration.new
  end


  def self.configure
    # self.configuration ||= Configuration.new
    yield(config)
  end

end


Dir["#{File.dirname(__FILE__)}/geopath/**/*.rb"].each { |f| require(f) }