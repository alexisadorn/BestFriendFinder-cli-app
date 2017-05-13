require_relative '../../../config/environment'

class Birds < Animals
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def species
    @species = "Bird"
  end

end
