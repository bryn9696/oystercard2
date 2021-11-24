require_relative 'oystercard.rb'
require_relative 'station.rb'
require_relative 'journey_log.rb'

class Journey

  MINIMUM_FARE = 1
  attr_reader :journey_log

  def initialize
    @journey_log = Journey_log.new
  end

  def in_journey?
    if @journey_log.entry_station != nil
      true
    else
      false
    end
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
      if @journey_log.entry_station == nil
        return 6
      else
        return MINIMUM_FARE
      end
    end
  end

end