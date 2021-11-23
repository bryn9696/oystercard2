require 'oystercard'

describe Oystercard do

  let(:station) { double :station }

  it 'checks balance' do
    oyster = Oystercard.new
    expect(oyster.balance).to eq 0
  end

  it 'checks for an empty journeys list' do
    expect(subject.journeys.count).to eq 0
  end
  
  describe '#top_up' do
    it 'Add money to card' do
      oyster = Oystercard.new
      expect(oyster.top_up(5)).to eq 5
    end
  end

    it 'Check users cannot deposit more than limit' do
      oyster = Oystercard.new
      expect {oyster.top_up(91)}.to raise_error("The limit is £90")
    end
  
    describe '#deduct' do
      xit 'Charges users after a trip' do
        oyster = Oystercard.new
        oyster.top_up(5)
        expect(oyster.deduct(3)).to eq(2)
      end
    end
  
    describe '#in_journey?' do
      it 'check if card is in journey' do
        oyster = Oystercard.new
        expect(oyster.in_journey?).to eq false
      end
    end

    describe '#touch_in' do
      it 'check if card is in journey when user starts trip' do
        subject.top_up(10)
        subject.touch_in("station")
        expect(subject.in_journey?).to eq true
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