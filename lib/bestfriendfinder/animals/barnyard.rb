require_relative '../../../config/environment'

class Barnyard < Animals
  @@all = []

  def self.all
    @@all
  end

end
