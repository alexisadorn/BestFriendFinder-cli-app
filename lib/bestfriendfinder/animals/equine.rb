require_relative '../../../config/environment'

class Equine < Animals
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def species
    @species = "Equine"
  end

end
