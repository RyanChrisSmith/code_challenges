require './lib/vehicle'

class Car < Vehicle

  def initialize(capacity, year_produced, make, model, color, location)
    @year_produced = year_produced
    @make = make
    @model = model
    self.color = color
    @description = "#{color} #{year_produced} #{make} #{model}"
    @fuel = false
    super(@description, capacity, location)
  end

  def color=(color)
    @color = color
  end

  def year_produced
    @year_produced
  end

  def make
    @make
  end

  def model
    @model
  end

  def color
    @color
  end

  def description
    @description
  end

  def fuel?
    @fuel
  end

  def location
    @location
  end

  def refuel
    if fuel?
      'No need to top off!'
    else
      @fuel = true
    end
  end

  def go_to(destination)
    if fuel?
      super(destination)
      @fuel = false
      "Traveling to #{destination}!"
    else
      "You need to refuel before heading to #{destination}!"
    end
  end
end

