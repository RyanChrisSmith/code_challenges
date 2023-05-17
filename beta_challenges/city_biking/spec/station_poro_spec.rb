require './lib/station_poro'

RSpec.describe StationPoro do
  let(:station_data) do
    { id: 72,
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
      landMark: '' }
  end
  let(:station) { StationPoro.new(station_data) }

  it 'exists' do
    expect(station).to be_a StationPoro
  end

  it 'has attributes' do
    expect(station.name).to eq('W 52 St & 11 Ave')
    expect(station.total_docks).to eq(39)
    expect(station.available_bikes).to eq(7)
  end

  it 'only has those attributes' do
    expect(station.instance_variables).to eq([:@name, :@total_docks, :@available_bikes])
    expect(station.instance_variables.length).to eq(3)
    expect(station.instance_variables.length).to_not eq(4)
    expect(station.instance_variables).to_not include(:@id, :@stationName, :@availableDocks, :@latitude, :@longitude, :@statusValue, :@statusKey, :@stAddress1, :@stAddress2, :@city, :@postalCode, :@location, :@altitude, :@testStation, :@lastCommunicationTime, :@landMark)
  end
end