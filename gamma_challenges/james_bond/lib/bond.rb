class Bond
  BOND_FILMS = [
    { title: "Skyfall", year: 2012, actor: "Daniel Craig", gross: "$1,108,561,008" },
    { title: "Thunderball", year: 1965, actor: "Sean Connery", gross: "$1,014,941,117" },
    { title: "Goldfinger", year: 1964, actor: "Sean Connery", gross: "$912,257,512" },
    { title: "Live and Let Die", year: 1973, actor: "Roger Moore", gross: "$825,110,761" },
    { title: "You Only Live Twice", year: 1967, actor: "Sean Connery", gross: "$756,544,419" },
    { title: "The Spy Who Loved Me", year: 1977, actor: "Roger Moore", gross: "$692,713,752" },
    { title: "Casino Royale", year: 2006, actor: "Daniel Craig", gross: "$669,789,482" },
    { title: "Moonraker", year: 1979, actor: "Roger Moore", gross: "$655,872,400" },
    { title: "Diamonds Are Forever", year: 1971, actor: "Sean Connery", gross: "$648,514,469" },
    { title: "Quantum of Solace", year: 2008, actor: "Daniel Craig", gross: "$622,246,378" },
    { title: "From Russia with Love", year: 1963, actor: "Sean Connery", gross: "$576,277,964" },
    { title: "Die Another Day", year: 2002, actor: "Pierce Brosnan", gross: "$543,639,638" },
    { title: "Goldeneye", year: 1995, actor: "Pierce Brosnan", gross: "$529,548,711" },
    { title: "On Her Majesty's Secret Service", year: 1969, actor: "George Lazenby", gross: "$505,899,782" },
    { title: "The World is Not Enough", year: 1999, actor: "Pierce Brosnan", gross: "$491,617,153" },
    { title: "For Your Eyes Only", year: 1981, actor: "Roger Moore", gross: "$486,468,881" },
    { title: "Tomorrow Never Dies", year: 1997, actor: "Pierce Brosnan", gross: "$478,946,402" },
    { title: "The Man with the Golden Gun", year: 1974, actor: "Roger Moore", gross: "$448,249,281" },
    { title: "Dr. No", year: 1962, actor: "Sean Connery", gross: "$440,759,072" },
    { title: "Octopussy", year: 1983, actor: "Roger Moore", gross: "$426,244,352" },
    { title: "The Living Daylights", year: 1987, actor: "Timothy Dalton", gross: "$381,088,866" },
    { title: "A View to a Kill", year: 1985, actor: "Roger Moore", gross: "$321,172,633" },
    { title: "License to Kill", year: 1989, actor: "Timothy Dalton", gross: "$285,157,191" }
  ].freeze

  def year_of(title)
    movie = BOND_FILMS.find { |film| film[:title] == title }
    movie[:year] if movie
  end

  def actor_in(title)
    actor = BOND_FILMS.find { |film| film[:title] == title }
    actor[:actor] if actor
  end

  def details_of_movie(year)
    movie = BOND_FILMS.find { |film| film[:year] == year }
    movie&.slice(:title, :actor, :gross)
  end

  def difference_years_released(title_1, title_2)
    movie_1 = BOND_FILMS.find { |film| film[:title] == title_1 }
    movie_2 = BOND_FILMS.find { |film| film[:title] == title_2 }
    (movie_1[:year] - movie_2[:year]).abs
  end

  def combined_value_years(title_1, title_2)
    movie_1 = BOND_FILMS.find { |film| film[:title] == title_1 }
    movie_2 = BOND_FILMS.find { |film| film[:title] == title_2 }
    movie_1[:year] + movie_2[:year]
  end

  def total_gross
    BOND_FILMS.sum { |film| film[:gross].delete('$,').to_i }
  end

  def all_bonds_unique
    BOND_FILMS.map { |film| film[:actor] }.uniq
  end

  def all_film_names_sorted
    sorted = BOND_FILMS.sort_by { |film| film[:year] }
    sorted.map { |film| film[:title] }
  end

  def odd_year_films
    sorted = BOND_FILMS.sort_by { |film| film[:year] }
    odd_years = sorted.select { |film| film[:year].odd? }
    odd_years.map { |film| film[:title] }
  end

  def after_year(year)
    sorted = BOND_FILMS.sort_by { |film| film[:year] }
    after_years = sorted.select { |film| film[:year] > year }
    after_years.map { |film| film[:title] }
  end

  def fewest_films_actor
    sorted = BOND_FILMS.sort_by { |film| film[:year] }
    fewest_films = sorted.map { |film| film[:actor] }.tally
    result = fewest_films.min_by { |actor, number_starred_in| number_starred_in }
    result[0]
  end

  def highest_grossing_film
    sorted = BOND_FILMS.sort_by { |film| film[:gross].delete("$,").to_i }
    sorted.last[:title]
  end

  def lowest_grossing_film
    sorted = BOND_FILMS.sort_by { |film| film[:gross].delete("$,").to_i }
    sorted.first[:title]
  end

  def films_per_actor
    BOND_FILMS.map { |film| film[:actor] }.tally
  end

end