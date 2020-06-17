module Geopath
  class Client
    include HTTParty
    base_uri Geopath.configuration.base_uri

    class << self
      def merge_headers(options = {})
        Geopath.configuration.headers.merge(options)
      end
    end
  end
end
