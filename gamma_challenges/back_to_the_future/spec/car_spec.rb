require './lib/car'

RSpec.describe Car do
  let(:delorian) { Car.new(2, 1981, 'DeLorean', 'DMC-12', 'gray', 'Hill Valley') }

  it 'should be a thing' do
    expect(delorian).to be_a Car
  end

  it 'has attributes' do
    expect(delorian.instance_variables).to eq(%i[@year_produced @make @model @color @description @fuel @capacity @location @passengers])
  end

  it 'refuels successfully' do
    expect(delorian.fuel?).to be false
    expect(delorian.refuel).to eq true
    expect(delorian.fuel?).to be true
  end

  it 'goes to a location successfully with fuel' do
    delorian.refuel
    expect(delorian.go_to('the future')).to eq "Traveling to the future!"
    expect(delorian.fuel?).to be false
  end

  it 'prevents going to a location without fuel' do
    expect(delorian.go_to('the future')).to eq "You need to refuel before heading to the future!"
    expect(delorian.fuel?).to be false
  end
end
