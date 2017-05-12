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
end
