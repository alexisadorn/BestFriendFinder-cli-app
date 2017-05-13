require_relative '../../config/environment.rb'

class BestFriendFinder::CLI

  PETS = ["Dogs", "Cats", "Rabbits", "Birds", "Equine", "Pigs", "Barnyard", "Small-Furry"]

  def initialize

  end

  def call
    puts "\nWelcome to Best Friend Finder!"
    puts "Are you ready to find your new best friend?\n\n"
    start
  end

  def start
    puts "What kind of friends would you like to meet today? (Please enter the number)\n"
    PETS.each.with_index(1) do |animal, number|
      puts "#{number}. #{animal}"
    end

    user_input = gets.chomp
    user_input = number_to_index(user_input)

    define_animal_object(user_input)

    Animal.new(PETS[user_input], user_input)

    display_all_animals
  end

  def number_to_index(user_input)
    user_input.to_i - 1
  end

  def define_animal_object(user_input)
    @animal_object = Object.const_get("BestFriendFinder::#{PETS[user_input]}")
  end

  def display_all_animals
    all_pets = @animal_object.all
    all_pets.each.with_index(1) {|pet, num| puts "#{num}. #{pet.name} - #{pet.breed} - #{pet.age}"}

    puts "Which would you like more information on? (Please enter the Number)"

    animal_number = gets.chomp
    index = number_to_index(animal_number)
    display_details(index)
  end

  def display_details(num)
      pet = @animal_object.all[num]
      puts pet.name
      puts "---------"
      puts "Breed: #{pet.breed}"
      puts "Age: #{pet.age}"
      puts "Size: #{pet.size}"
      puts "Color: #{pet.color}"
      puts "Sex: #{pet.sex}\n\n"
      puts "#{pet.description}\n\n"
      puts "For more info on how to adopt #{pet.name}, visit www.bestfriends.org/#{pet.url}"
  end

  # Write method to ask user if they want to loop back and do it again
end
