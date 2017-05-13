require_relative '../../../config/environment'

class Dogs < Animals
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def species
    @species = "Dog"
  end

end
