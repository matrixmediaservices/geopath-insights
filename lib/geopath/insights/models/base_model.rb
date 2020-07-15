module Geopath
  module Insights
    module Models
      class BaseModel
        attr_accessor :data

        def initialize(data)
          @data = data
        end

        def method_missing(method_name, *arguments, &block)
          @data[method_name.to_s]
        end
      end
    end
  end
end
