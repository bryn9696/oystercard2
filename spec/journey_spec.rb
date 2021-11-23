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
        journey = Journey.new
        oyster.top_up(10)
        oyster.touch_in("station")
        expect(oyster.in_journey?).to eq true
      end
  
      it 'will not touch in if below minimum balance' do
        expect{ subject.touch_in("station") }.to raise_error "Insufficient funds"
      end

    it 'checks entry station when touched in' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq(station)
    end

    end

    describe '#touch_out' do
      it 'check if card has finished journey' do
        oyster = Oystercard.new
        oyster.touch_out("not home")
        expect(oyster.in_journey?).to eq false
      end

      it 'charges the oyster at end of trip' do
        oyster = Oystercard.new
        oyster.top_up(5)
        oyster.touch_in("station")
        expect { oyster.touch_out("not home") }.to change{oyster.balance}.by (-1)
      end
      it 'resets entry station to nil' do
        subject.top_up(10)
        subject.touch_in("station 5")
        subject.touch_out("not home")
        expect(subject.entry_station).to eq(nil)
    end
      it 'checks a journey has been created' do
        subject.top_up(10)
        subject.touch_in("station 5")
        subject.touch_out("not home")
        expect(subject.journeys.count).not_to eq 0
      end
    end
  end