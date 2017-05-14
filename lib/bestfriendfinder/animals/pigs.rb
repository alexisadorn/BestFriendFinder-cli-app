require_relative '../../../config/environment'

class Pigs < Animals
  @@all = []

  def self.all
    @@all
  end

end
