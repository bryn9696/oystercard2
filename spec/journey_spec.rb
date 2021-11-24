require 'journey'
require 'oystercard'
require 'station'

describe Journey do


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
      expect(oyster.journey.journey_log.entry_station).to eq("station")
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
        expect(oyster.journey.journey_log.entry_station).to eq(nil)
    end
     
    end

    context "Fares" do

      it "Should return a fare" do
        expect(subject.fare("In")).to be_instance_of(Integer)
      end

      it "Should return a penalty fare if no entry station" do
        expect(subject.fare("Out")).to eq(6)
      end

      it "Should return a penalty fare if no exit station" do
        subject.journey_log.journey_start("Waterloo")
        expect(subject.fare("In")).to eq(6)
      end

      it "Should return a minimum fare if no penalty" do
        subject.journey_log.journey_start("Waterloo")
        expect(subject.fare("Out")).to eq(1)
      end
    end
  end