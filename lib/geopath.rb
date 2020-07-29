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

require 'geopath/client'

require 'geopath/insights/inventory'
require 'geopath/insights/segments'
require 'geopath/insights/models/base_model'
require 'geopath/insights/models/inventory/classification_type'
require 'geopath/insights/models/inventory/constructions'
require 'geopath/insights/models/inventory/illumination_type'
require 'geopath/insights/models/inventory/media_type'
require 'geopath/insights/models/inventory/operator'
require 'geopath/insights/models/inventory/search'
require 'geopath/insights/models/inventory/spot_frame_media_name'


# Dir["#{File.dirname(__FILE__)}/geopath/**/*.rb"].each { |f| require(f) }