require_relative 'service'
require_relative 'station_poro'

class Parameters

  def more_docks_more_bikes(number_of_docks, number_of_bikes)
    final = []
    stations = Service.new.get_all_stations
    stations[:stationBeanList].each do |station|
      if station[:totalDocks] >= number_of_docks && station[:availableBikes] >= number_of_bikes
        final << StationPoro.new(station)
      end
    end

    "The following mega-stations have more than #{number_of_bikes} bikes available:\n #{final.map {|station| "#{station.name} (#{station.available_bikes} bikes available)"}.join("\n ")}"
  end
end