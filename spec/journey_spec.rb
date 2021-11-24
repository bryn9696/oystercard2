require 'journey'
require 'oystercard'
require 'station'

describe Journey do
  it 'checks for an empty journeys list' do
    expect(subject.journeys.count).to eq 0
  end

  describe '#in_journey?' do
    it 'check if card is in journey' do
      journey = Journey.new
      expect(journey.in_journey?).to eq false
    end
  end

    describe '#touch_in' do
      it 'check if card is in journey when user starts trip' do
        oyster = Oystercard.new
        oyster.top_up(10)
        oyster.touch_in("station")
        expect(oyster.journey.in_journey?).to eq true
      end

    it 'checks entry station when touched in' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in("station")
      expect(oyster.journey.entry_station).to eq("station")
    end

    end

    describe '#touch_out' do
      it 'check if card has finished journey' do
        journey = Journey.new
        oyster = Oystercard.new
        oyster.touch_out("not home")
        expect(journey.in_journey?).to eq false
      end

      it 'resets entry station to nil' do
        oyster = Oystercard.new
        oyster.top_up(10)
        oyster.touch_in("station 5")
        oyster.touch_out("not home")
        expect(subject.entry_station).to eq(nil)
    end
      it 'checks a journey has been created' do
        oyster = Oystercard.new
        oyster.top_up(10)
        oyster.touch_in("station 5")
        oyster.touch_out("not home")
        expect(oyster.journey.journeys.count).not_to eq 0
      end
    end
  end