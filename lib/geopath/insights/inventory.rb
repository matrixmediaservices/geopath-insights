module Geopath
  module Insights
    class Inventory < Geopath::Client
      class << self
        def search(query = {})
          options = merge_headers({ body: query.to_json })
          results = post('/inventory/search', options)

          results = Geopath::Insights::Models::Inventory::Search.new(results['inventory_summary'])
          block_given? ? yield(results) : results
        end

        def operators(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/operators', options)
          results = results['operators'].map do |operator|
            Geopath::Insights::Models::Inventory::Operator.new(operator)
          end
          block_given? ? yield(results) : results
        end

        def classification_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/classification_types', options)
          results = results['classification_types'].map do |classification_type|
            Geopath::Insights::Models::Inventory::ClassificationType.new(classification_type)
          end

          block_given? ? yield(results) : results
        end

        def constructions(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/constructions', options)
          results = results['constructions'].map do |construction|
            Geopath::Insights::Models::Inventory::Construction.new(construction)
          end
          block_given? ? yield(results) : results
        end

        def spot_frame_media_names(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/spot/framemedianames', options)
          results = results['frame_media_names'].map do |frame_media_name|
            Geopath::Insights::Models::Inventory::SpotFrameMediaName.new(frame_media_name)
          end
          block_given? ? yield(results) : results
        end

        def status_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/status_types', options)
          block_given? ? yield(results) : results
        end

        def representation_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/representation_types', options)
          block_given? ? yield(results) : results
        end

        def place_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/place_types', options)
          block_given? ? yield(results) : results
        end

        def representations(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/representations', options)
          block_given? ? yield(results) : results
        end

        def places(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/places', options)
          block_given? ? yield(results) : results
        end

        def placement_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/placement_types', options)
          block_given? ? yield(results) : results
        end

        def operator(id)
          options = merge_headers({})
          results = get("/inventory/operators/#{id}", options)
          block_given? ? yield(results) : results
        end

        def media_types(query = {})
          options = merge_headers({ query: query })
          results = get("/inventory/media_types", options)
          results = results['media_types'].map do |media_type|
            Geopath::Insights::Models::Inventory::MediaType.new(media_type)
          end
          block_given? ? yield(results) : results
        end

        def illumination_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/illumination_types', options)
          results = results['illumination_types'].map do |illumination_type|
            Geopath::Insights::Models::Inventory::IlluminationType.new(illumination_type)
          end
          block_given? ? yield(results) : results
        end

        def construction_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/construction_types', options)
          block_given? ? yield(results) : results
        end
      end
    end
  end
end

