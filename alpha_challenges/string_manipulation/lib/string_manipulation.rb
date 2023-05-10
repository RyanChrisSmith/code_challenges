class StringManipulation
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def initialism
    string.split.map(&:chr).join
  end

  def count(word)
    string.scan(word).count
  end

  def replace_various_elements
    string.gsub(' ', '_').gsub('\n', '*').gsub('Sam', 'Ryan').gsub('o', '0').gsub('green', 'blue')
  end
end
