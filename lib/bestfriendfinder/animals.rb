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
    check_attributes_for_nil
    self
  end

  def check_attributes_for_nil
    self.name = "N/A" if self.name == nil || self.name == "" || self.name == " "
    self.breed = "N/A" if self.breed == nil || self.breed == "" || self.breed == " "
    self.age = "N/A" if self.age == nil || self.age == "" || self.age == " "
    self.url = "N/A" if self.url == nil || self.url == "" || self.url == " "
    self.size = "N/A" if self.size == nil || self.size == "" || self.size == " "
    self.color = "N/A" if self.color == nil || self.color == "" || self.color == " "
    self.sex = "N/A" if self.sex == nil || self.sex == "" || self.sex == " "
    self.description = "N/A" if self.description == nil || self.description == "" || self.description == " "
  end

end
