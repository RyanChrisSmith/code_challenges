# frozen_string_literal: true

require './lib/bicycle'

RSpec.describe Bicycle do # rubocop:todo Metrics/BlockLength
  let(:hot_ride) { Bicycle.new('Huffy', 'Milwaukee, WI') }
  it 'should be a thing' do
    expect(hot_ride).to be_a Bicycle
  end

  it 'has attributes' do
    expect(hot_ride.description).to eq('Huffy')
    expect(hot_ride.passengers).to eq([])
    expect(hot_ride.location).to eq('Milwaukee, WI')
    expect(hot_ride.capacity).to eq(2)
  end

  context '2 passenger capacity' do
    it 'cannot have more than 2 passengers' do
      hot_ride.add_passenger('Charlie')
      hot_ride.add_passenger('Jude')
      expect(hot_ride.passengers).to eq(%w[Charlie Jude])
      expect(hot_ride.passengers.count).to eq(2)

      hot_ride.add_passenger('Ella')
      expect(hot_ride.passengers).to eq(%w[Charlie Jude])
      expect(hot_ride.passengers.count).to eq(2)
    end

    it 'will be in danger with 2 passengers' do
      hot_ride.add_passenger('Charlie')
      expect(hot_ride.in_danger?).to eq(false)

      hot_ride.add_passenger('Jude')
      expect(hot_ride.in_danger?).to eq(true)
    end
  end

  context '#go_to' do
    it "returns 'Crash!!' 50% of the time when in danger" do
      hot_ride.add_passenger('Alice')
      hot_ride.add_passenger('Bob')

      allow(hot_ride).to receive(:rand).and_return(0.4)

      expect(hot_ride.go_to('store')).to eq 'Crash!!'
    end

    it 'returns the destination when not in danger' do
      hot_ride.add_passenger('Alice')
      hot_ride.add_passenger('Bob')

      allow(hot_ride).to receive(:rand).and_return(0.6)

      expect(hot_ride.go_to('store')).to eq('The Huffy is off to store')
    end

    it 'clears passengers when it crashes' do
      hot_ride.add_passenger('Alice')
      hot_ride.add_passenger('Bob')
      expect(hot_ride.passengers).to eq(%w[Alice Bob])

      allow(hot_ride).to receive(:rand).and_return(0.4)

      expect(hot_ride.go_to('store')).to eq 'Crash!!'
      expect(hot_ride.passengers).to eq([])
    end
  end
end
