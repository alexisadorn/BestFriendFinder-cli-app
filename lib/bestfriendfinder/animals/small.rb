require_relative '../../../config/environment'

class Small < Animals
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def species
    @species = "Small & Furry"
  end

end
