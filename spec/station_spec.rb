require 'station'

describe Station do 
  it 'returns the zone of a station' do 
    expect(subject.check_zone("Edgware")).to eq("Zone_5")
  end
end