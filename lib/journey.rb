require_relative 'oystercard.rb'
require_relative 'station.rb'

class Journey

  attr_reader :entry_station, :journeys

  MINIMUM_FARE = 1
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

  def touch_in(start)
    fail "Insufficient funds" if @balance < 1
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journeys << {entry: @entry_station, end_trip: exit_station}
    @entry_station = nil
  end

end