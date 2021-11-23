require_relative 'journey.rb'

class Oystercard
  
  DEFAULT_BALANCE = 0
  LIMIT = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def balance
    @balance
  end

  def top_up(value)
    raise "The limit is £#{LIMIT}" if (@balance + value) > LIMIT 
    @balance += value
    
  end

  private
  def deduct(trip)
    @balance -= trip
  end
end




