class Journey_log

  attr_reader :entry_station
  def initialize
    @entry_station = nil
    @journeys = []
  end

  def journey_start(start)
    @entry_station = start
  end

  def journey_end(exit_station)
    @journeys << {entry: @entry_station, end_trip: exit_station}
    @entry_station = nil
  end

  def journey_history
    return journey_list
  end

  private
  def journey_list
    return @journeys
  end
end