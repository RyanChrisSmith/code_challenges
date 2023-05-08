# frozen_string_literal: true

class Vehicle # rubocop:todo Style/Documentation
  attr_reader :description, :passengers, :location, :capacity

  def initialize(description, capacity, location)
    @description = description
    @capacity = capacity
    @location = location
    @passengers = []
  end

  def add_passenger(passenger)
    passengers << passenger
  end

  def in_danger?
    passengers.count > @capacity
  end

  def go_to(destination)
    if passengers.count.positive?
      @location = destination
      "The #{description} is off to #{location}"
    else
      "This #{description} is empty!"
    end
  end
end
