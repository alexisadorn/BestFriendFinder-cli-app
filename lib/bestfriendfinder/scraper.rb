require_relative '../../config/environment'

class BestFriendFinder::Scraper

  def self.scrape_adoptable_pets(animal)
    pets = []
    doc = Nokogiri::HTML(open("http://bestfriends.org/adopt/adopt-our-sanctuary/#{animal}"))
    doc.css("div.rg-animal").each do |pet|
      pet_details = {}
      pet_details[:name] = pet.css("span.animalName").text
      pet_details[:breed] = pet.css("span.animalBreed").text
      pet_details[:age] = pet.css("span.animalAge").text
      pets << pet_details
    end
    pets
  end

  def self.find_details_url(pet_name)
    # Take the pet's name, scrape the main pet page and look for the CSS tag.text that equal the same name.
    # Once you have found that, pass that URL into a new Scraper method to scrape_pet_profile
    # Return hash of pet profile information
  end
end
