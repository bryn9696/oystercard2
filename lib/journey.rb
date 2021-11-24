# frozen_string_literal: true

require_relative 'oystercard'
require_relative 'station'
require_relative 'journey_log'

#This is a class called Journey
class Journey
  MINIMUM_FARE = 1
  attr_reader :journey_log

  def initialize
    @journey_log = Journey_log.new
  end

  def in_journey?
    if !@journey_log.entry_station.nil?
      true
    else
      false
    end
  end

  def fare(inout, zone = 1)
    if inout == 'In'
      @zone_in = zone
      if in_journey? == true
        return 6
      else
        return 0
      end
    end
    if inout == 'Out'
      if @journey_log.entry_station.nil?
        6
      else
        fare_calc(zone)
      end
    end
  end

  def fare_calc(zone)
    ((@zone_in - zone).abs + 1) 
  end
end
