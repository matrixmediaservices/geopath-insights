module Geopath
  class Configuration
    attr_accessor :consumer_key, :secret_key, :base_uri, :user_agent

    def initialize
      @consumer_key   = nil
      @secret_key     = nil
      @base_uri       = 'https://api.geopath.org/v2.1/'
      @user_agent     = 'Geopath Insights API Gem (matrixmediaservices.com)'
    end

    def headers
      { 
        headers: {
          'Geopath-API-Key' => consumer_key,
          'Content-Type'    => 'application/json',
          'User-Agent'      => user_agent
        }
      }
    end
  end
end
