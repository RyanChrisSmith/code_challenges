# frozen_string_literal: true

require './lib/vehicle'

class Bicycle < Vehicle # rubocop:todo Style/Documentation
  def initialize(description, location)
    super(description, 2, location)
  end

  def add_passenger(passenger)
    return unless passengers.count < 2

    passengers << passenger
  end

  def in_danger?
    passengers.count >= 2
  end

  def go_to(destination)
    if in_danger?
      if rand < 0.5
        passengers.clear
        return 'Crash!!'
      end

      super(destination)
    else
      "This #{description} is empty!"
    end
  end
end
