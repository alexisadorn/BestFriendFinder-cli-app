require_relative '../../config/environment'

class Animal
  attr_reader :species, :animal_index

  PETS = ["Dogs", "Cats", "Rabbits", "Birds", "Equine", "Pigs", "Barnyard", "Small-Furry"]

  def initialize(species, user_input)
    @species = species.downcase
    @animal_index = user_input
    define_animal_object
    scrape_animal_page
    add_attributes_to_animals
  end

  def define_animal_object
    @animal_object = Object.const_get("BestFriendFinder::#{PETS[@animal_index]}")
  end

  def scrape_animal_page
    hash_of_pets = BestFriendFinder::Scraper.scrape_adoptable_pets(@species)
    @animal_object.create_new(hash_of_pets)
    # Method above creates new objects based on the species name that the user chose. Then it calls
    # on a create_new method, which is currently in Dogs. But I will probably create a module to connect
    # the dog object to so that each animal object can pull from the same #create_new method.
  end

  def add_attributes_to_animals
    @animal_object.all.each do |pet|
        attributes = BestFriendFinder::Scraper.scrape_pet_profile(pet.url)
        pet.add_attributes(attributes)
      end
  end

end
