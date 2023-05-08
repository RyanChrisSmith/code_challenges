# frozen_string_literal: true

require './lib/vehicle'

class Skateboard < Vehicle # rubocop:todo Style/Documentation
  attr_accessor :goofy

  def initialize(description, location)
    super(description, 1, location)
    @goofy = false
  end

  def grind
    if passengers?
      'khkhkhkhkh klunck khkh'
    else
      "This #{description} skateboard is empty!"
    end
  end

  def goofy?
    @goofy
  end

  def kickflip
    if passengers?
      'Rad! I can kickflip!'
    else
      "This #{description} skateboard is empty!"
    end
  end

  def passengers?
    passengers.length.positive?
  end
end
