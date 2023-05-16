class MethodMadness
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def find_album(&block)
    collection.find(&block)
  end

  def check_for_single(title)
    this_album = find_album { |album| album[:singles].include?(title) }
    return unless this_album

    "Yes, they released #{title} in #{this_album[:release_date][6..9]}."
  end

  def check_for_label(label)
    this_album = find_album { |album| album[:label] == label }
    return unless this_album

    "Yes, they released #{this_album[:title]} on #{label} in #{this_album[:release_date][6..9]}."
  end

  def check_for_album(title)
    this_album = find_album { |album| album[:title] == title }
    return unless this_album

    "Yes, they released #{title} on #{this_album[:label]} in #{this_album[:release_date][6..9]}."
  end

  def change_album_label(title, label)
    this_album = find_album { |album| album[:title] == title }
    return unless this_album

    this_album[:label] = label
    "#{title} is now released on #{label}."
  end

  def add_song(song_title, album_title)
    this_album = find_album { |album| album[:title] == album_title }
    return if this_album[:singles].include?(song_title)

    this_album[:singles] << song_title
  end

  def single_sampler
    collection.map { |album| album[:singles] }.flatten
  end

  def single_counter(album_title)
    album = find_album { |album| album[:title] == album_title }

    album[:singles].count
  end

  def album_length(album_title)
    this_album = find_album { |album| album[:title] == album_title }

    this_album[:length]
  end

  def singlegram
    collection.map { |album| [album[:title], album[:singles].count] }.to_h
  end

  def wu_marathon
    total = collection.sum { |album| album[:length].to_i }
    "#{total}:00"
  end

end
