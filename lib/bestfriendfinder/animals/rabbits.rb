require_relative '../../../config/environment'

class Rabbits < Animals
  @@all = []

  def self.all
    @@all
  end

end
