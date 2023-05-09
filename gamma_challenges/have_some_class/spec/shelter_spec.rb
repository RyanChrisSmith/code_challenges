require './lib/shelter'
require './lib/animal'

RSpec.describe Shelter do
  let(:dumb_friends_league) { Shelter.new('Dumb Friends League') }
  let(:fido) { Animal.new('Fido', 'Dog') }
  let(:fuzzy) { Animal.new('Fuzzy', 'Cat') }
  let(:polly) { Animal.new('Polly', 'Parrot') }

  it 'exists' do
    expect(dumb_friends_league).to be_a(Shelter)
  end

  it 'has a name' do
    expect(dumb_friends_league.name).to eq('Dumb Friends League')
  end

  it 'starts with no animals' do
    expect(dumb_friends_league.animals).to eq([])
  end

  it '#add_animal' do
    dumb_friends_league.add_animal(fido)

    expect(dumb_friends_league.animals).to eq([fido])
    expect(dumb_friends_league.animals.count).to eq(1)
  end

  it '#adopt' do
    expect(dumb_friends_league.adopt(fido)).to eq('We cannot adopt out an animal we dont have, sorry.')
    dumb_friends_league.add_animal(fido)
    dumb_friends_league.add_animal(fuzzy)

    expect(dumb_friends_league.animals.count).to eq(2)

    dumb_friends_league.adopt(fido)

    expect(dumb_friends_league.animals.count).to eq(1)
    expect(dumb_friends_league.animals).to_not include(fido)
    expect(dumb_friends_league.animals).to include(fuzzy)
  end

  it 'should be able to display all animals and respective statuses' do
    fido.add_toy('bone')
    fuzzy.add_toy('mouse')
    fuzzy.add_toy('ball')
    dumb_friends_league.add_animal(fido)
    dumb_friends_league.add_animal(fuzzy)
    dumb_friends_league.add_animal(polly)

    expect(dumb_friends_league.display_all_animals).to eq("Fido the Dog is #{fido.cleanliness} and has 1 toy.\nFuzzy the Cat is #{fuzzy.cleanliness} and has 2 toys.\nPolly the Parrot is #{polly.cleanliness} and has 0 toys.")
  end
end