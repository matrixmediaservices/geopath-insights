RSpec.describe Geopath::Insights::Segments do
  before(:each) do
    Geopath.configure do |config|
      config.consumer_key = ENV['GEOPATH_API_KEY']
    end
  end

  describe '#catalog' do
    describe 'sources' do
      it 'should exist' do
        search = Geopath::Insights::Segments.catalog
        expect(search['sources'].size).to be > 0
      end

      it 'should have categories' do
        search = Geopath::Insights::Segments.catalog
        expect(search['sources'].first['categories'].size).to be > 0
      end
    end
  end

  describe '#segment' do
    it 'should get ABC' do
      search = Geopath::Insights::Segments.segment(4670)
      expect(search['name']).to eq('ABC')
    end

  end

end