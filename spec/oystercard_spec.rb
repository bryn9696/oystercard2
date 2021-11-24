require 'oystercard'
require 'journey'

describe Oystercard do

  let(:station) { double :station }

  it 'checks balance' do
    oyster = Oystercard.new
    expect(oyster.balance).to eq 0
  end

  it 'will not touch in if below minimum balance' do
    expect{ subject.touch_in("station") }.to raise_error "Insufficient funds"
  end

  it 'charges the oyster at end of trip' do
    oyster = Oystercard.new
    oyster.top_up(5)
    oyster.touch_in("station")
    expect { oyster.touch_out("not home") }.to change{oyster.balance}.by (-1)
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
      expect(oyster.send(:deduct,3)).to eq(2)
    end
    end
  
    
end