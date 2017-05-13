require_relative '../../config/environment'

class Animal
  attr_reader :species

  def initialize(species)
    @species = species
    scrape_animal_page
    add_attributes_to_animals
  end

  def scrape_animal_page
    hash_of_pets = BestFriendFinder::Scraper.scrape_adoptable_pets(@species)
    if @species == "dogs"
      BestFriendFinder::Dogs.create_dogs(hash_of_pets)
    end
  end

  def add_attributes_to_animals
    if @species == "dogs"
      BestFriendFinder::Dogs.all.each do |dog|
        attributes = BestFriendFinder::Scraper.scrape_pet_profile(dog.url)
        dog.add_dog_attributes(attributes)
      end
    end
  end

end
