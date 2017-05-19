class CLI
  PETS = ["Dogs", "Cats", "Rabbits", "Birds", "Equine", "Pigs", "Barnyard", "Small"]

  def call
    puts "\nWELCOME TO BEST FRIEND FINDER!".light_blue
    puts "--------------------------------"
    start
  end

  def start
    puts "What kind of friends would you like to find today? (Please enter a number)\n".cyan

    PETS.each.with_index(1) do |animal, number|
      puts "#{number}. #{animal}"
    end

    user_input = number_to_index(gets.chomp)

    if !user_input.between?(0, PETS.size-1)
      puts "\nI'm sorry, that was an incorrect entry. Please try again.\n".red
      start
    end

    @animal_object = define_animal_object(user_input)
    AnimalFactory.new(PETS[user_input], @animal_object)

    display_all_animals
  end

  def display_all_animals
    if @animal_object == Small
      puts "\n\nAVAILABLE SMALL & FURRY ANIMALS FOR ADOPTION:".light_blue
    else
      puts "\n\nAVAILABLE #{@animal_object.to_s.upcase} FOR ADOPTION:".light_blue
    end
    puts "Name - Breed - Age".cyan
    puts "-----------------------------"

    all_pets = @animal_object.all
    all_pets.each.with_index(1) {|pet, num| puts "#{num}. #{pet.name} - #{pet.breed} - #{pet.age}"}

    puts "\nWhich pet would you like more information on? (Please enter a number)".cyan

    animal_number = number_to_index(gets.chomp)

    if animal_number < 0 || animal_number >= all_pets.size
      puts "I'm sorry, that was an incorrect entry. Please try again.".red
      display_all_animals
    end

    AnimalFactory.add_attributes_to_animals(animal_number, @animal_object)
    display_details(animal_number)
  end

  def display_details(num)
      pet = @animal_object.all[num]
      if pet.species == "small-furry"
        puts "\n#{pet.name.upcase} - Small & Furry".light_blue
      else
        puts "\n#{pet.name.upcase} - #{pet.species.capitalize}".light_blue
      end
      puts "------------------------------".cyan
      puts "Breed:".green + " #{pet.breed}"
      puts "Age:".green + " #{pet.age}"
      puts "Size:".green + " #{pet.size}"
      puts "Color:".green + " #{pet.color}"
      puts "Sex:".green  + " #{pet.sex}\n\n"
      puts "#{pet.description}\n\n"
      puts "For more info on how to adopt #{pet.name}, visit www.bestfriends.org#{pet.url}"

      repeat?
  end

  def repeat?
    puts "\n\nWould you like to search more adoptable pets? (Please enter a number)\n".cyan
    puts "1. Yes, take me back to the list of available #{@animal_object.to_s.downcase}."
    puts "2. Yes, take me back to the main menu."
    puts "3. No, I'm done.\n\n"
    user_input = gets.chomp

    if user_input == "1"
      display_all_animals
    elsif user_input == "2"
      start
    elsif user_input == "3"
      exit
    else
      puts "I'm sorry, I didn't understand that answer.".red
      repeat?
    end
  end

  def number_to_index(user_input)
    user_input.to_i - 1
  end

  def define_animal_object(user_input)
    Object.const_get("#{PETS[user_input]}")
  end
end
