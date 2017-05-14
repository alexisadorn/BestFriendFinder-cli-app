require_relative '../../../config/environment'

class Birds < Animals
  @@all = []

  def self.all
    @@all
  end

end
