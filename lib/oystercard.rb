# frozen_string_literal: true

require_relative 'journey'
require_relative 'station'

class Oystercard
  attr_reader :balance, :journey

  DEFAULT_BALANCE = 0
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @journey = Journey.new
    @balance = balance
  end

  def top_up(value)
    raise "The limit is £#{LIMIT}" if (@balance + value) > LIMIT

    @balance += value
  end

  def touch_in(start)
    zone = if start.is_a?(Station)
             start.zone
           else
             1
           end
    start = start.name if start.is_a?(Station)
    amount = journey.fare('In', zone)
    deduct(amount)
    raise 'Insufficient funds' if @balance < 1

    @journey.journey_log.journey_start(start)
  end

  def touch_out(exit_station)
    zone = if exit_station.is_a?(Station)
             start.zone
           else
             1
           end
    exit_station = exit_station.name if exit_station.is_a?(Station)
    amount = journey.fare('Out', zone)
    deduct(amount)
    @journey.journey_log.journey_end(exit_station)
  end

  private

  def deduct(trip)
    @balance -= trip
  end
end
