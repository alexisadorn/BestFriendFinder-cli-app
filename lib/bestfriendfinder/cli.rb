require_relative '../../config/environment.rb'

class BestFriendFinder::CLI

  def initialize

  end

  def call
    puts "\nWelcome to Best Friend Finder!"
    puts "Are you ready to find your new best friend?\n\n"
    puts "What kind of friends would you like to meet today? (Please enter the number)\n"
    puts "
      1. Dogs
      2. Cats
      3. Rabbits
      4. Birds
      5. Equine
      6. Pigs
      7. Barnyard
      8. Small & Furry"

    new_friend = gets.chomp

    case new_friend
      when "1"
        @species = "dogs"
      when "2"
        @species = "cats"
      when "3"
        @species = "rabbits"
      when "4"
        @species = "birds"
      when "5"
        @species = "equine"
      when "6"
        @species = "pigs"
      when "7"
        @species = "barnyard"
      when "8"
        @species = "small-furry"
      else
        puts "I'm sorry, that is in an invalid number"
        self.call
      end

    Animal.new(@species)

    display_all_animals
  end

  def number_to_index(user_input)
    user_input.to_i - 1
  end

  def display_all_animals
    if @species == "dogs"
      all_dogs = BestFriendFinder::Dogs.all
      all_dogs.each.with_index(1) {|dog, num| puts "#{num}. #{dog.name} - #{dog.breed} - #{dog.age}"}
    end

    puts "Which of our #{@species} would you like more information on? (Please enter the Number)"
    animal_number = gets.chomp
    index = number_to_index(animal_number)
    display_details(index)
  end

  def display_details(num)
    if @species == "dogs"
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
  end

  # Write method to ask user if they want to loop back and do it again
end
