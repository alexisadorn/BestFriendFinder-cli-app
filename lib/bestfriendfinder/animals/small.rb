require_relative '../../../config/environment'

class Small < Animals

  @@all = []

  def self.all
    @@all
  end

end
