class Shelter
  attr_reader :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def add_animal(animal)
    animals << animal
  end

  def adopt(animal)
    if animals.include?(animal)
      animals.delete(animal)
    else
      'We cannot adopt out an animal we dont have, sorry.'
    end
  end

  def display_all_animals
    animals.map(&:status).join("\n")
  end
end