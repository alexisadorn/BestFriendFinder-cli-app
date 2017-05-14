require_relative '../../../config/environment'

class Cats < Animals
  @@all = []

  def self.all
    @@all
  end

end
