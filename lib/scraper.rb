class Scraper

  def self.scrape_adoptable_pets(animal)
    pets = []
    doc = Nokogiri::HTML(open("http://bestfriends.org/adopt/adopt-our-sanctuary/#{animal}"))
    doc.css("div.rg-animal").each do |pet|
      pet_details = {}
      pet_details[:species] = animal
      pet_details[:name] = pet.css("span.animalName").text
      pet_details[:breed] = pet.css("span.animalBreed").text
      pet_details[:age] = pet.css("span.animalAge").text
      pet_details[:url] = pet.css("a").attribute("href").value
      pets << pet_details
    end
    pets
  end

  def self.scrape_pet_profile(url)
    pet_profile_details = {}

    dog_profile = "http://bestfriends.org" + url
    doc = Nokogiri::HTML(open(dog_profile))

    pet_items = doc.css("div.rescue-groups-pet-info-item")

    pet_items.each do |attribute|
      if attribute.css("span.gray").text == "Size:"
        pet_profile_details[:size] = attribute.css("span.bold.black").text
      elsif attribute.css("span.gray").text == "Color:"
        pet_profile_details[:color] = attribute.css("span.bold.black").text
      elsif attribute.css("span.gray").text == "Sex:"
        pet_profile_details[:sex] = attribute.css("span.bold.black").text
      end
    end
    pet_profile_details[:description] = doc.css("section.rescue-groups-pet-info-section p").text.gsub("\n                        ", "")
    pet_profile_details
  end
end
