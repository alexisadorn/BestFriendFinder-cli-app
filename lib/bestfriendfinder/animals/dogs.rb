require_relative '../../../config/environment'

class Dogs < Animals
  @@all = []

  def self.all
    @@all
  end

end
