class Oystercard
  attr_reader :status
  
  DEFAULT_BALANCE = 0
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE, status =false)
    @balance = balance
    @status = status
  end

  def balance
    @balance
  end

  def top_up(value)
    raise "The limit is £#{LIMIT}" if (@balance + value) > LIMIT 
    @balance += value
    
  end

  def in_journey?
    @status 
  end

  def touch_in
    fail "Insufficient funds" if @balance < 1
    @status = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @status = false
  end

  private
  def deduct(trip)
    @balance -= trip
  end
end