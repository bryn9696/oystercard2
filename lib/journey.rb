require_relative 'oystercard.rb'
require_relative 'station.rb'

class Journey

  MINIMUM_FARE = 1
  attr_reader :entry_station, :journeys

  def initialize
    @entry_station = nil
    @journeys = []
  end

  def in_journey?
    if @entry_station != nil
      true
    else
      false
    end
  end

  def journey_start(start)
    @entry_station = start
  end

  def journey_end(exit_station)
    @journeys << {entry: @entry_station, end_trip: exit_station}
    @entry_station = nil
  end

  def fare(inout)
    if inout == "In"
      if in_journey? == true
        return 6
      else
        return 0
      end
    end
    if inout == "Out"
      if @entry_station == nil
        return 6
      else
        return MINIMUM_FARE
      end
    end
  end

end