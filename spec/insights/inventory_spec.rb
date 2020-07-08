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

    it 'should find the correct inventory' do
      query = { 
        'page_size': 10,
        'id_type': 'plant_frame_id',
        'id_list': ['BK-003']
       }
      Geopath::Insights::Inventory.search(query) do |response|
        expect(response['inventory_summary']['inventory_items'][0]['plant_frame_id']).to eq('BK-003')
      end
    end

    it 'should get multiple records for frame id' do 
      query = { 
        'page_size': 10, 
        'id_type': 'plant_frame_id',
        'id_list': ['1004']
       }
       Geopath::Insights::Inventory.search(query) do |response|
        expect(response['inventory_summary']['inventory_items'].size).to be > 0
        response['inventory_summary']['inventory_items'].each do |inventory_item|
          expect(inventory_item['plant_frame_id']).to eq('1004')
        end
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

  describe '#operator' do
    it 'should return Lamar' do
      search = Geopath::Insights::Inventory.operator(20)
      expect(search['name']).to eq('Lamar')
    end

  end

  describe '#classification_types' do
    it 'should get list of classification types' do
      search = Geopath::Insights::Inventory.classification_types
      expect(search['classification_types'].size).to be > 0
    end
  end

  describe '#constructions' do
    it 'should get a list of constructions' do
      search = Geopath::Insights::Inventory.constructions
      expect(search['constructions'].size).to be > 0
    end

    it 'should get CHI0012AB by name' do
      search = Geopath::Insights::Inventory.constructions({ construction_name: 'CHI0012AB' })
      expect(search['constructions'][0]['name']).to eq('CHI0012AB')
    end

    it 'should get CHI0012AB by id' do
      search = Geopath::Insights::Inventory.constructions({ construction_id: 2410 })
      expect(search['constructions'][0]['name']).to eq('CHI0012AB')
    end
  end

  describe '#spot_frame_media_names' do
    before(:each) do
      @search = Geopath::Insights::Inventory.spot_frame_media_names
    end

    it 'should get a list of frame media names' do
      expect(@search['frame_media_names'].size).to be > 0
    end

    it 'should have entry for Digital bulletins' do
      expect(@search['frame_media_names']).to include('Digital Bulletins')
    end
  end

  describe '#status_types' do
    it 'should get a list of status types' do
      search = Geopath::Insights::Inventory.status_types
      expect(search['status_types'].size).to be > 0
    end
  end

  describe '#representation_types' do
    it 'should get a list of representation types' do
      search = Geopath::Insights::Inventory.representation_types
      expect(search['representation_types'].size).to be > 0
    end
  end

  describe '#place_types' do
    before(:each) do
      @search = Geopath::Insights::Inventory.place_types
    end

    it 'should get a list of place types' do
      expect(@search['place_types'].size).to be > 0
    end

    it 'should have entry for Gym' do
      names = @search['place_types'].map { |p| p['name'] }
      expect(names).to include('Gym')
    end
  end

  describe '#representations' do
    before(:each) do
      @search = Geopath::Insights::Inventory.representations
    end
    
    it 'should return a list of representations' do
      expect(@search['representations'].size).to be > 0
    end

    it 'should have a representation_type' do
      expect(@search['representations'][0]['representation_type']['id']).not_to be_nil
    end

    it 'should have a account' do
      expect(@search['representations'][0]['account']['id']).not_to be_nil
    end
  end

  describe '#places' do
    it 'should return a list of places' do
      search = Geopath::Insights::Inventory.places
      expect(search['places'].size).to be > 0
    end

    it 'should return a list of Theaters when searched by name' do
      search = Geopath::Insights::Inventory.places({ place_type_name:  'Theater' })
      expect(search['places'].size).to be > 0
      expect(search['places'][0]['place_type']['name']).to eq('Theater')
    end

    it 'should return listings for 4 Star Cinemas' do
      search = Geopath::Insights::Inventory.places({ place_name: '4 Star Cinemas' })
      expect(search['places'].size).to be > 0
      expect(search['places'][0]['place_name']).to eq('4 Star Cinemas')
    end
  end

  describe '#placement_types' do
    it 'should get a list of placement types' do
      search = Geopath::Insights::Inventory.placement_types
      expect(search['placement_types'].size).to be > 0
    end
  end

  describe '#media_types' do
    it 'should get a list of media types' do 
      search = Geopath::Insights::Inventory.media_types
      expect(search['media_types'].size).to be > 0
    end
  end

  describe '#illumination_types' do
    it 'should get a list of illumination types' do
      search = Geopath::Insights::Inventory.illumination_types
      expect(search['illumination_types'].size).to be > 0
    end
  end

  describe '#construction_types' do
    it 'should get a list of construction types' do
      search = Geopath::Insights::Inventory.construction_types
      expect(search['construction_types'].size).to be > 0
    end
  end
end