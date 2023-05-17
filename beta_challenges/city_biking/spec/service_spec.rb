require './lib/service'

RSpec.describe Service do
  let(:service) { Service.new }
  let(:expected) do
    { executionTime: '2016-01-22 04:32:49 PM',
      stationBeanList: [{ id: 72,
                          stationName: 'W 52 St & 11 Ave',
                          availableDocks: 32,
                          totalDocks: 39,
                          latitude: 40.76727216,
                          longitude: -73.99392888,
                          statusValue: 'In Service',
                          statusKey: 1,
                          availableBikes: 7,
                          stAddress1: 'W 52 St & 11 Ave',
                          stAddress2: '',
                          city: '',
                          postalCode: '',
                          location: '',
                          altitude: '',
                          testStation: false,
                          lastCommunicationTime: '2016-01-22 04:30:15 PM',
                          landMark: '' },
                        { id: 79,
                          stationName: 'Franklin St & W Broadway',
                          availableDocks: 0,
                          totalDocks: 33,
                          latitude: 40.71911552,
                          longitude: -74.00666661,
                          statusValue: 'In Service',
                          statusKey: 1,
                          availableBikes: 33,
                          stAddress1: 'Franklin St & W Broadway',
                          stAddress2: '',
                          city: '',
                          postalCode: '',
                          location: '',
                          altitude: '',
                          testStation: false,
                          lastCommunicationTime: '2016-01-22 04:32:41 PM',
                          landMark: '' },
                        { id: 82,
                          stationName: 'St James Pl & Pearl St',
                          availableDocks: 27,
                          totalDocks: 27,
                          latitude: 40.71117416,
                          longitude: -74.00016545,
                          statusValue: 'In Service',
                          statusKey: 1,
                          availableBikes: 0,
                          stAddress1: 'St James Pl & Pearl St',
                          stAddress2: '',
                          city: '',
                          postalCode: '',
                          location: '',
                          altitude: '',
                          testStation: false,
                          lastCommunicationTime: '2016-01-22 04:29:41 PM',
                          landMark: '' }] }
  end

  it 'returns a Hash of all the bike stations form the API' do
    allow(service).to receive(:get_all_stations).and_return(expected)

    expect(service.get_all_stations).to be_a Hash
  end

  it 'has a key of :stationBeanList' do
    allow(service).to receive(:get_all_stations).and_return(expected)

    expect(service.get_all_stations).to have_key :stationBeanList
  end

  it 'has a key within :stationBeanList for :totalDocks and :availableBikes ' do
    allow(service).to receive(:get_all_stations).and_return(expected)

    stations = service.get_all_stations

    stations[:stationBeanList].each do |station|
      expect(station).to have_key :totalDocks
      expect(station).to have_key :availableBikes
    end
  end
end
