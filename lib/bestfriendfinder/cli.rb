require_relative '../../config/environment.rb'

class BestFriendFinder::CLI
  include BestFriendFinder::Definable

  def call
    puts "\nWelcome to Best Friend Finder!"
    puts "-----------------------------------"
    puts "Are you ready to find your new best friend?\n\n"
    start
  end

  def start
    puts "What kind of friends would you like to meet today? (Please enter the number)\n\n"

    PETS.each.with_index(1) do |animal, number|
      puts "#{number}. #{animal}"
    end

    user_input = number_to_index(gets.chomp)
    puts "Thank you for your input. One moment as we pull up a list of furry friends...\n\n"

    @animal_object = define_animal_object(user_input)
    AnimalFactory.new(PETS[user_input], @animal_object)
    
    display_all_animals
    replay?
  end

  def display_all_animals
    puts "\n AVAILABLE FOR ADOPTION: \n"
    puts "-----------------------------"

    all_pets = @animal_object.all
    all_pets.each.with_index(1) {|pet, num| puts "#{num}. #{pet.name} - #{pet.breed} - #{pet.age}"}

    puts "\nWhich pet would you like more information on? (Please enter a number)\n"

    animal_number = number_to_index(gets.chomp)
    display_details(animal_number)
  end

  def display_details(num)
      pet = @animal_object.all[num]
      puts "\n#{pet.name.upcase}"
      puts "------------------------------"
      puts "Breed: #{pet.breed}"
      puts "Age: #{pet.age}"
      puts "Size: #{pet.size}"
      puts "Color: #{pet.color}"
      puts "Sex: #{pet.sex}\n\n"
      puts "#{pet.description}\n\n"
      puts "For more info on how to adopt #{pet.name}, visit www.bestfriends.org#{pet.url}"
  end

  def replay?
    puts "\n\nWould you like to search more adoptable pets? [Yes/No]\n"
    user_input = gets.chomp

    if ["Yes", "yes", "Y", "y"].include?(user_input)
      start
    elsif ["No", "no", "N", "n"].include?(user_input)
      exit
    else
      puts "I'm sorry, I didn't understand that answer."
      replay?
    end
  end
end
