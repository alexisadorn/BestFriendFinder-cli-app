require_relative '../../config/environment.rb'

class BestFriendFinder::CLI

  def initialize

  end

  def call
    puts "Hello! Ready to find your new best friend?"
    puts "What kind of friend are you looking for today?"
    puts "Dog | Cat | Rabbit | Bird | Horse | Pig"
    friend = gets.chomp
    case friend
    when "dog" # handle uppercase spelling
      scrape_and_create_dogs
      add_attributes_to_dogs

      all_dogs = BestFriendFinder::Dogs.all
      all_dogs.each.with_index(1) {|dog, index| puts "#{index}. #{dog.name} - #{dog.breed} - #{dog.age}"}
      puts "Which dog would you like more information on? (Number)"
      dog_num = gets.chomp
      index = find_dog_number(dog_num)
      display_dog_details(index)
      # Find out which pet is associated with the number
      # Pass that pet's name into the Scraper find_details_url
      # Get back a hash of pet details
      # Add those pet details to the Dog instance
      # Return the details information to the user
    when "cat"
      puts "Here are all the cats up for adoption:"
      puts "Garfield"
      puts "Tom"
    when "rabbit"
      puts "Here are all the rabbits up for adoption:"
      puts "Easter Bunny"
      puts "Jack"
    when "bird"
      puts "Here are all the birds up for adoption:"
      puts "Toucan Sam"
      puts "Big Bird"
    when "horse"
      puts "Here are all the horses up for adoption:"
      puts "Shadowfax"
      puts "Bill the Pony"
    when "pig"
      puts "Here are all the pigs up for adoption"
      puts "Babe"
      puts "Wilbur"
    else
      puts "Sorry, we do not have that animal here."
    end
  end

  def scrape_and_create_dogs
    pets = BestFriendFinder::Scraper.scrape_adoptable_pets("dogs")
    dog = BestFriendFinder::Dogs.create_dogs(pets)

  end

  def add_attributes_to_dogs
    BestFriendFinder::Dogs.all.each do |dog|
      attributes = BestFriendFinder::Scraper.scrape_pet_profile(dog.url)
      dog.add_dog_attributes(attributes)
    end
  end

  def find_dog_number(user_input)
    user_input.to_i - 1
  end

  def display_dog_details(num)
    dog = BestFriendFinder::Dogs.all[num]
    puts dog.name
    puts "---------"
    puts "Breed: #{dog.breed}"
    puts "Age: #{dog.age}"
    puts "Size: #{dog.size}"
    puts "Color: #{dog.color}"
    puts "Sex: #{dog.sex}\n\n"
    puts "#{dog.description}\n\n"
    puts "For more info on how to adopt #{dog.name}, visit www.bestfriends.org/#{dog.url}"
  end

  # Write method to ask user if they want to loop back and do it again
end
