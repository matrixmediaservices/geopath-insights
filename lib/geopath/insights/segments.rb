module Geopath
  module Insights
    class Segments < Geopath::Client
      class << self
        def catalog(query = {})
          options = merge_headers({ query: query })
          results = get('/segments/catalog', options)
          block_given? ? yield(results) : results
          
        end


        def segment(segment_id, query = {})
          options = merge_headers({ query: query })
          results = get("/segments/#{segment_id}", options)
          block_given? ? yield(results) : results
        end
      end
    end
  end
end