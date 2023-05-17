class StationPoro
  attr_reader :name,
              :total_docks,
              :available_bikes

  def initialize(station_data)
    @name = station_data[:stationName]
    @total_docks = station_data[:totalDocks]
    @available_bikes = station_data[:availableBikes]
  end
end