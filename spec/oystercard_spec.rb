require 'oystercard'

describe Oystercard do
  it 'checks balance' do
    oyster = Oystercard.new
    expect(oyster.balance).to eq 0
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
      it 'Charges users after a trip' do
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

    describe '#in_journey' do
      it 'check if card is in journey when user starts trip' do
        oyster = Oystercard.new
        oyster.touch_in
        expect(oyster.in_journey?).to eq true
      end
    end

    describe '#touch_in' do
      it 'Checks card has minimum balance required' do
        oyster = Oystercard.new
        expect(oyster.touch_in).to eq true
      end
    end

    describe '#touch_out' do
      it 'check if card has finished journey' do
        oyster = Oystercard.new
        oyster.touch_in
        oyster.touch_out
        expect(oyster.in_journey?).to eq false
      end
    end
end




