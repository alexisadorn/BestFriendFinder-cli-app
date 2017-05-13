require_relative '../../../config/environment'

class Barnyard < Animals
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def species
    @species = "Barnyard"
  end

end
