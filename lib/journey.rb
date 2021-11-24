require_relative 'oystercard.rb'
require_relative 'station.rb'

class Journey

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

end