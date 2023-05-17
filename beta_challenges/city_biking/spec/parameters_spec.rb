require './lib/parameters'

RSpec.describe Parameters do
  let(:parameters) { Parameters.new }

  it 'exists' do
    expect(parameters).to be_a Parameters
  end

  describe 'Instance Methods' do
    describe '#more_docks_more_bikes' do
      it 'returns a list of the stations with at least the amount of docks and bikes requested' do
        expect(parameters.more_docks_more_bikes(60, 10)).to eq("The following mega-stations have more than 10 bikes available:\n Atlantic Ave & Fort Greene Pl (40 bikes available)\n Pershing Square North (23 bikes available)")
      end
    end
  end
end