RSpec.describe Geopath do
  it "has a version number" do
    expect(Geopath::VERSION).not_to be nil
  end

  it "allows configuration" do
    Geopath.configure do |config|
      config.consumer_key = 'testing'
    end

    expect(Geopath.configuration.consumer_key).to eq('testing')
  end


end
