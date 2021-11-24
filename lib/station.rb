# frozen_string_literal: true

class Station
  attr_reader :name, :zone

  def initialize(name = 'Waterloo', zone = 1)
    @name = name
    @zone = zone
  end

  def check_zone(station)
    return_zone = ''

    stations =
      { 'Zone_1' => 'Liverpool Street',
        'Zone_2' => 'Tower Hill',
        'Zone_3' => 'Moorgate',
        'Zone_4' => 'Holborn',
        'Zone_5' => 'Edgware',
        'Zone_6' => 'Tulse Hill' }

    stations.each do |key, value|
      return_zone = key if station == value
    end
    return_zone
  end
end
