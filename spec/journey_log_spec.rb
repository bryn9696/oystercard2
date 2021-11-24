# frozen_string_literal: true

require 'journey_log'

describe Journey_log do
  it 'checks for an empty journeys list' do
    expect(subject.send(:journey_list).count).to eq 0
  end

  it 'checks a journey has been created' do
    oyster = Oystercard.new
    oyster.top_up(10)
    oyster.touch_in('station 5')
    oyster.touch_out('not home')
    expect(oyster.journey.journey_log.send(:journey_list).count).not_to eq 0
  end
end
