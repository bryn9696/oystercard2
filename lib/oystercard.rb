class Oystercard
  attr_reader :balance, :status
  
  DEFAULT_BALANCE = 0
  LIMIT = 90

  def initialize(balance = DEFAULT_BALANCE, status =false)
    @balance = balance
    @status = status
  end

  def top_up(value)
    raise "The limit is £#{LIMIT}" if (@balance + value) > LIMIT 
    @balance += value
  end

  def deduct(trip)
    @balance - trip
  end

  def in_journey?
    @status 
  end

  def touch_in
    @status = true
  end

  def touch_out
    @status = false
  end
end