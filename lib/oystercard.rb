class Oystercard
  attr_reader :entry_station, :journeys
  
  DEFAULT_BALANCE = 0
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
    @journeys = []
  end

  def balance
    @balance
  end

  def top_up(value)
    raise "The limit is £#{LIMIT}" if (@balance + value) > LIMIT 
    @balance += value
    
  end

  def in_journey?
    if @entry_station != nil
      true
    else
      false
    end
  end

  def touch_in(entry_zone)
    fail "Insufficient funds" if @balance < 1
    @entry_station = entry_zone
  end

  def touch_out(exit_zone)
    deduct(MINIMUM_FARE)
    @journeys << {entry: @entry_station, end_trip: exit_zone}
    @entry_station = nil
  end

  private
  def deduct(trip)
    @balance -= trip
  end
end