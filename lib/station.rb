class Station

  def check_zone(station)
    return_zone = ""

    stations = 
      {"Zone_1" => "Liverpool Street",
      "Zone_2" => "Tower Hill",
      "Zone_3" => "Moorgate",
      "Zone_4" => "Holborn",
      "Zone_5" => "Edgware",
      "Zone_6" => "Tulse Hill"}
   
      stations.each do |key, value|
        if station == value
          return_zone = key
        end
      end
      return_zone
  end

end
