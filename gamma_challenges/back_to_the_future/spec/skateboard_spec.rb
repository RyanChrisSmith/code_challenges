# frozen_string_literal: true

require './lib/skateboard'

RSpec.describe Skateboard do # rubocop:todo Metrics/BlockLength
  let(:my_sweet_deck) { Skateboard.new('Santa Cruz', 'Washington Square Park') }
  it 'should be a thing' do
    expect(my_sweet_deck).to be_a Skateboard
  end

  it 'has attributes' do
    expect(my_sweet_deck.description).to eq('Santa Cruz')
    expect(my_sweet_deck.passengers).to eq([])
    expect(my_sweet_deck.location).to eq('Washington Square Park')
    expect(my_sweet_deck.capacity).to eq(1)
  end

  context '#grind' do
    it 'cannot grind without a passenger' do
      expect(my_sweet_deck.grind).to eq('This Santa Cruz skateboard is empty!')
    end

    it 'can grind with a passenger' do
      my_sweet_deck.add_passenger('Charlie')
      expect(my_sweet_deck.grind).to eq('khkhkhkhkh klunck khkh')
    end
  end

  context '#goofy?' do
    it 'is not goofy by default' do
      expect(my_sweet_deck.goofy?).to eq(false)
    end

    it 'can be goofy' do
      my_sweet_deck.goofy = true

      expect(my_sweet_deck.goofy?).to eq(true)
    end
  end

  context '#kickflip' do
    it 'cannot kickflip without a passenger' do
      expect(my_sweet_deck.kickflip).to eq('This Santa Cruz skateboard is empty!')
    end

    it 'can kickflip with a passenger' do
      my_sweet_deck.add_passenger('Charlie')

      expect(my_sweet_deck.kickflip).to eq('Rad! I can kickflip!')
    end
  end
end
