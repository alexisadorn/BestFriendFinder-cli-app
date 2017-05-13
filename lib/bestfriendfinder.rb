require_relative "../config/environment"

module BestFriendFinder
  module Definable
    PETS = ["Dogs", "Cats", "Rabbits", "Birds", "Equine", "Pigs", "Barnyard", "Small-Furry"]

    def number_to_index(user_input)
      user_input.to_i - 1
    end

    def define_animal_object(user_input)
      Object.const_get("BestFriendFinder::#{PETS[user_input]}")
    end

  end
end
