require_relative 'journey.rb'

class Oystercard

  attr_reader :balance, :journey
  
  DEFAULT_BALANCE = 0
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @journey = Journey.new
    @balance = balance
  end

  def balance
    @balance
  end

  def top_up(value)
    raise "The limit is £#{LIMIT}" if (@balance + value) > LIMIT 
    @balance += value
  end

  def touch_in(start)
    amount = journey.fare("In")
    deduct(amount)
    fail "Insufficient funds" if @balance < 1
    @journey.journey_log.journey_start(start)
  end

  def touch_out(exit_station)
    amount = journey.fare("Out")
    deduct(amount)
    @journey.journey_log.journey_end(exit_station)
  end

  private
  def deduct(trip)
    @balance -= trip
  end
end




