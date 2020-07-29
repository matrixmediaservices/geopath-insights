module Geopath
  module Insights
    module Models
      module Inventory
        class SpotFrameMediaName < Geopath::Insights::Models::BaseModel
          def name
            @data
          end
        end
      end
    end
  end
end