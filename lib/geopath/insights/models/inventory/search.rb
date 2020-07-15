module Geopath
  module Insights
    module Models
      module Inventory
        class Search < Geopath::Insights::Models::BaseModel

          def inventory_items
            @inventory_items ||= @data['inventory_items'].map do |inventory_item|
              InventoryItem.new(inventory_item)
            end
          end
        end

        class InventoryItem < Geopath::Insights::Models::BaseModel
          def representations
            @representations ||= @data['representations'].map do |representation|
              Representation.new(representation)
            end
          end

          def account
            representations.first.account
          end

          def location
            @location ||= Location.new(@data['location'])
          end

          def spot_references
            @spot_references ||= @data['spot_references'].map do |spot_reference|
              SpotReference.new(spot_reference)
            end
          end

          def measures
            spot_references.first.measures
          end

          def impressions
            measures.impressions
          end

          def media_type
            Geopath::Insights::Models::Inventory::MediaType.new(@data['media_type'])
          end

          def illumination_type
            Geopath::Insights::Models::Inventory::IlluminationType.new(@data['illumination_type'])
          end
        end

        class Representation < Geopath::Insights::Models::BaseModel
          def representation_type
            @representation_type ||= RepresentationType.new(@data['representation_type'])
          end

          def account
            @account ||= Account.new(@data['account'])
          end
        end

        class RepresentationType < Geopath::Insights::Models::BaseModel

        end

        class Account < Geopath::Insights::Models::BaseModel
          def parent_name
            parent_account_name
          end

          def combined_name
            "#{parent_name} - #{name}"
          end
        end

        class Location < Geopath::Insights::Models::BaseModel
          def read
            @read ||= primary_read || 'N/A'
          end

          def artery
            primary_artery
          end
        end

        class SpotReference < Geopath::Insights::Models::BaseModel
          def measures
            @measures ||= Measures.new(@data['measures'])
          end
        end

        class Measures < Geopath::Insights::Models::BaseModel
          def target_geography
            target_geo
          end

          def impressions
            imp
          end
        end
      end
    end
  end
end
