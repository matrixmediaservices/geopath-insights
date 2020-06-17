RSpec.describe Geopath::Insights::Inventory do
  before(:each) do
    Geopath.configure do |config|
      config.consumer_key = ENV['GEOPATH_API_KEY']
    end
  end
  
  describe '#search' do
    it 'should return 10 results' do
      query = {
        "page_size": 10, 
        "target_segment": "6285",
        "operator_name_list": ["Lamar"]
      }

      search = Geopath::Insights::Inventory.search(query)
      expect(search["inventory_summary"]["inventory_count"]).to eq(10)
    end

    it "should accept a block" do
      query = {
        "page_size": 10, 
        "target_segment": "6285",
        "operator_name_list": ["Lamar"]
      }
      Geopath::Insights::Inventory.search(query) do |response|
        expect(response["inventory_summary"]["inventory_count"]).to eq(10)
      end
    end
  end

  describe '#operators' do
    it 'should get a list of operators' do
      search = Geopath::Insights::Inventory.operators({})
      expect(search.size).to be > 0
    end

    it 'should return Lamar by name search' do
      search = Geopath::Insights::Inventory.operators({ operator_name: 'Lamar' })
      expect(search['operators'][0]['name']).to eq('Lamar')
    end

    it 'should return Lamar by id search' do
      search = Geopath::Insights::Inventory.operators({ operator_id: 20 })
      expect(search['operators'][0]['name']).to eq('Lamar')
    end
  end


end