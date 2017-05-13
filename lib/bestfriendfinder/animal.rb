require_relative '../../config/environment'

class Animal
  include BestFriendFinder::Definable

  attr_reader :species

  def initialize(species, object)
    @species = species.downcase
    @animal_object = object

    scrape_and_create_animals
    add_attributes_to_animals
  end

  def scrape_and_create_animals # Scrapes page ending with /@species and creates new objects based on the previously defined species object
    hash_of_pets = BestFriendFinder::Scraper.scrape_adoptable_pets(@species)
    @animal_object.create_new(hash_of_pets)
  end

  def add_attributes_to_animals
    @animal_object.all.each do |pet|
        attributes = BestFriendFinder::Scraper.scrape_pet_profile(pet.url)
        pet.add_attributes(attributes)
      end
  end

end
