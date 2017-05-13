require_relative '../../../config/environment'

class Cats < Animals
  attr_reader :species
  
  @@all = []

  def self.all
    @@all
  end

  def species
    @species = "Cat"
  end

end
