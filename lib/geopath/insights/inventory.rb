module Geopath
  module Insights
    class Inventory < Geopath::Client
      class << self
        def search(query = {})
          options = merge_headers({ body: query.to_json })
          results = post('/inventory/search', options)
          block_given? ? yield(results) : results

        end

        def operators(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/operators', options)
          block_given? ? yield(results) : results
        end

        def classification_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/classification_types', options)
          block_given? ? yield(results) : results
        end

        def constructions(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/constructions', options)
          block_given? ? yield(results) : results
        end

        def spot_frame_media_names(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/spot/framemedianames', options)
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
          block_given? ? yield(results) : results
        end

        def illumination_types(query = {})
          options = merge_headers({ query: query })
          results = get('/inventory/illumination_types', options)
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

