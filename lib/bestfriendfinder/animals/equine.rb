require_relative '../../../config/environment'

class Equine < Animals
  @@all = []

  def self.all
    @@all
  end

end
