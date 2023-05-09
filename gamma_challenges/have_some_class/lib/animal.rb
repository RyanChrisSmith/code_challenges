class Animal
  attr_reader :name, :species, :cleanliness, :toys, :status

  def initialize(name, species)
    @name = name
    @species = species
    @clean = rand(100)
    @cleanliness = get_cleanliness(@clean)
    @toys = []
    update_status
  end

  def add_toy(toy)
    toys << toy
    update_status
  end

  def destroy_toy(toy)
    toys.delete(toy)
    update_status
  end

  private

  CLEAN_MAPPING = {
    'Squeaky Clean' => 0..10,
    'Mostly Clean' => 11..20,
    'Starting to Stink' => 21..30,
    'Stinker Pants' => 31..40,
    'Stink Machine' => 41..50,
    'Staying Outside' => 51..60,
    'Bothering the Neighbors' => 61..70,
    'Call the Hazmat Team' => 71..80,
    'Biohazard' => 81..90,
    'Radioactive' => 91..100
  }

  def get_cleanliness(clean)
    CLEAN_MAPPING.select { |k, v| v.include?(@clean) }.keys.first
  end

  def update_status
    toy_or_toys = toys.count == 1 ? 'toy' : 'toys'
    @status = "#{name} the #{species} is #{cleanliness} and has #{toys.count} #{toy_or_toys}."
  end

end