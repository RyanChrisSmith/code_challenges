# frozen_string_literal: true

require './lib/vehicle'

RSpec.describe Vehicle do # rubocop:todo Metrics/BlockLength
  let(:v1) { Vehicle.new('horse and buggy', 4, 'Burton, OH') }

  it 'should be a thing' do
    expect(v1).to be_a Vehicle
  end

  it 'has attributes' do
    expect(v1.description).to eq('horse and buggy')
    expect(v1.passengers).to eq([])
    expect(v1.location).to eq('Burton, OH')
  end

  it '#add_passenger' do
    v1.add_passenger('Charlie')
    v1.add_passenger('Jude')
    expect(v1.passengers).to eq(%w[Charlie Jude])
  end

  it '#in_danger?' do
    v1.add_passenger('Jacob Miller')
    v1.add_passenger('John Miller')
    v1.add_passenger('Isaac Miller')
    v1.add_passenger('Mark Yoder')
    expect(v1.in_danger?).to eq(false)

    v1.add_passenger('Jesse Yoder')
    expect(v1.in_danger?).to eq(true)
  end

  context '#go_to' do
    it 'will change location' do
      v1.add_passenger('Jacob Miller')

      expect(v1.go_to('the barn dance!')).to eq('The horse and buggy is off to the barn dance!')
    end

    it 'will not change location if no passengers' do
      expect(v1.go_to('the barn dance!')).to eq('This horse and buggy is empty!')
    end
  end
end
