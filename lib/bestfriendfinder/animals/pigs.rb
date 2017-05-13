require_relative '../../../config/environment'

class Pigs < Animals
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def species
    @species = "Pig"
  end

end
