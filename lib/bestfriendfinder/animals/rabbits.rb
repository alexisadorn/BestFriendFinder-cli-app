require_relative '../../../config/environment'

class Rabbits < Animals
  attr_reader :species
  @@all = []

  def self.all
    @@all
  end

  def species
    @species = "Rabbit"
  end
end
