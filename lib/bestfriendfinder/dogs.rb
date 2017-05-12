require_relative '../../config/environment'

class BestFriendFinder::Dogs
  attr_accessor :name, :breed, :age

  @@all = []

  def initialize(attributes)
    attributes.each {|k, v| self.send(("#{k}="), v)}
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create_dogs(pet_array)
    pet_array.each do |pet_hash|
      self.new(pet_hash)
    end
  end
end
