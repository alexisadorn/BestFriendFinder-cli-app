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
      pets = BestFriendFinder::Scraper.scrape_adoptable_pets("dogs")
      dog = BestFriendFinder::Dogs.create_dogs(pets)
      all_dogs = BestFriendFinder::Dogs.all
      all_dogs.each.with_index(1) {|dog, index| puts "#{index}. #{dog.name} - #{dog.breed} - #{dog.age}"}
      # Make Dog objects
      # Display Dogs
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

  # Write method to ask user if they want to loop back and do it again
end
