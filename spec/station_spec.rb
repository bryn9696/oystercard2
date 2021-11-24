# frozen_string_literal: true

require 'station'

describe Station do
  it 'returns the zone of a station' do
    expect(subject.check_zone('Edgware')).to eq('Zone_5')
  end

  it "It knows it's name" do
    station = Station.new('Waterloo', 2)
    expect(station.name).to eq 'Waterloo'
    expect(station.zone).to eq 2
  end
end
