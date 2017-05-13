require_relative '../../../config/environment'

class Dogs < Animals
  include BestFriendFinder::Definable

  @@all = []

  def self.all
    @@all
  end

end
