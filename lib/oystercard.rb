class Oystercard
  attr_reader :balance
  
  DEFAULT_BALANCE = 0
  LIMIT = 90
  
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(value)
    raise "The limit is £#{LIMIT}" if value > LIMIT
      value
  end

  def deduct(trip)
    
  end

end