require_relative '../../config/environment'

class Animals
  attr_accessor :name, :breed, :age, :url, :size, :color, :sex, :description

  def initialize(attributes)
    attributes.each {|k, v| self.send(("#{k}="), v)}
    self.class.all << self unless self.class.all.any? {|dog| dog.name == self.name && dog.breed == self.breed && dog.age == self.age}
  end

  def self.create_new(pet_array)
    pet_array.each do |pet_hash|
      self.new(pet_hash)
    end
  end

  def add_attributes(details_hash)
    details_hash.each do |k, v|
      self.send(("#{k}="), v)
    end
    self
  end

end
