require './lib/bond'

RSpec.describe Bond do
  it '#year' do
    expect(Bond.new.year_of('Skyfall')).to eq(2012)
  end

  it '#actor' do
    expect(Bond.new.actor_in('Skyfall')).to eq('Daniel Craig')
  end

  it '#details_of_movie' do
    expect(Bond.new.details_of_movie(2012)).to eq({ title: 'Skyfall',  actor: 'Daniel Craig', gross: '$1,108,561,008' })
  end

  it '#difference_years_released' do
    expect(Bond.new.difference_years_released('Skyfall', 'Quantum of Solace')).to eq(4)
  end

  it '#combined_value_years' do
    expect(Bond.new.combined_value_years('Skyfall', 'Quantum of Solace')).to eq(4020)
  end

  it '#total_gross' do
    expect(Bond.new.total_gross).to eq(13_821_621_224)
  end

  it '#all_bonds_unique' do
    expect(Bond.new.all_bonds_unique).to eq(['Daniel Craig', 'Sean Connery', 'Roger Moore', 'Pierce Brosnan', 'George Lazenby', 'Timothy Dalton'])
  end

  it '#all_film_names' do
    expect(Bond.new.all_film_names_sorted).to eq(['Dr. No', 'From Russia with Love', 'Goldfinger', 'Thunderball', 'You Only Live Twice', "On Her Majesty's Secret Service", 'Diamonds Are Forever', 'Live and Let Die', 'The Man with the Golden Gun', 'The Spy Who Loved Me', 'Moonraker', 'For Your Eyes Only', 'Octopussy', 'A View to a Kill', 'The Living Daylights', 'License to Kill', 'Goldeneye', 'Tomorrow Never Dies', 'The World is Not Enough', 'Die Another Day', 'Casino Royale', 'Quantum of Solace', 'Skyfall'])
  end

  it '#odd_year_films' do
    expect(Bond.new.odd_year_films).to eq(["From Russia with Love", "Thunderball", "You Only Live Twice", "On Her Majesty's Secret Service", "Diamonds Are Forever", "Live and Let Die", "The Spy Who Loved Me",  "Moonraker", "For Your Eyes Only", "Octopussy", "A View to a Kill", "The Living Daylights", "License to Kill", "Goldeneye", "Tomorrow Never Dies", "The World is Not Enough"])
  end

  it '#after_year(1980)' do
    expect(Bond.new.after_year(1980)).to eq(["For Your Eyes Only", "Octopussy", "A View to a Kill", "The Living Daylights", "License to Kill", "Goldeneye", "Tomorrow Never Dies", "The World is Not Enough", "Die Another Day", "Casino Royale", "Quantum of Solace", "Skyfall"])
  end

  it '#fewest_films_actor' do
    expect(Bond.new.fewest_films_actor).to eq("George Lazenby")
  end

  it '#highest_grossing_film' do
    expect(Bond.new.highest_grossing_film).to eq("Skyfall")
  end

  it '#lowest_grossing_film' do
    expect(Bond.new.lowest_grossing_film).to eq("License to Kill")
  end

  it '#films_per_actor' do
    expect(Bond.new.films_per_actor).to eq({"Daniel Craig"=>3, "Sean Connery"=>6, "Roger Moore"=>7, "Pierce Brosnan"=>4, "George Lazenby"=>1, "Timothy Dalton"=>2})
  end
end
