class CLI
  PETS = ["Dogs", "Cats", "Rabbits", "Birds", "Equine", "Pigs", "Barnyard", "Small"]

  def call
    puts "\nWelcome to Best Friend Finder!"
    puts "-----------------------------------"
    puts "Are you ready to find your new best friend?\n"
    start
  end

  def start
    puts "\nWhat kind of friends would you like to meet today? (Please enter the number)\n\n"

    PETS.each.with_index(1) do |animal, number|
      puts "#{number}. #{animal}"
    end

    user_input = number_to_index(gets.chomp)

    if user_input < 0 || user_input >= PETS.size
      puts "I'm sorry, that was an incorrect entry. Please try again."
      start
    end

    puts "\nThank you for your input. One moment as we pull up a list of available #{PETS[user_input].downcase}..."

    @animal_object = define_animal_object(user_input)
    AnimalFactory.new(PETS[user_input], @animal_object)

    display_all_animals
  end

  def display_all_animals
    if @animal_object == Small
      puts "\n\nAVAILABLE SMALL & FURRY ANIMALS FOR ADOPTION: \n"
    else
      puts "\n\nAVAILABLE #{@animal_object.to_s.upcase} FOR ADOPTION: \n"
    end
    puts "Name - Breed - Age"
    puts "-----------------------------"

    all_pets = @animal_object.all
    all_pets.each.with_index(1) {|pet, num| puts "#{num}. #{pet.name} - #{pet.breed} - #{pet.age}"}

    puts "\nWhich pet would you like more information on? (Please enter a number)\n"

    animal_number = number_to_index(gets.chomp)

    if animal_number < 0 || animal_number >= all_pets.size
      puts "I'm sorry, that was an incorrect entry. Please try again."
      display_all_animals
    end

    display_details(animal_number)
  end

  def display_details(num)
      pet = @animal_object.all[num]
      if pet.species == "small-furry"
        puts "\n#{pet.name.upcase} - Small & Furry"
      else
        puts "\n#{pet.name.upcase} - #{pet.species.capitalize}"
      end
      puts "------------------------------"
      puts "Breed: #{pet.breed}"
      puts "Age: #{pet.age}"
      puts "Size: #{pet.size}"
      puts "Color: #{pet.color}"
      puts "Sex: #{pet.sex}\n\n"
      puts "#{pet.description}\n\n"
      puts "For more info on how to adopt #{pet.name}, visit www.bestfriends.org#{pet.url}"

      repeat?
  end

  def repeat?
    puts "\n\nWould you like to search more adoptable pets?\n"
    puts "1. Yes, take me back to the list of available #{@animal_object.to_s.downcase}."
    puts "2. Yes, take me back to the main menu."
    puts "3. No, I'm done.\n\n"
    puts "Please enter a number.\n"
    user_input = gets.chomp

    if user_input == "1"
      display_all_animals
    elsif user_input == "2"
      start
    elsif user_input == "3"
      exit
    else
      puts "I'm sorry, I didn't understand that answer."
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
