class Animals
  attr_accessor :species, :name, :breed, :age, :url, :size, :color, :sex, :description

  def initialize(attributes)
    attributes.each {|k, v| self.send(("#{k}="), v)}
    self.class.all << self unless self.class.all.any? {|pet| pet.url == self.url}
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
    attributes = ["species", "name", "breed", "age", "url", "size", "color", "sex", "description"]
    empty = [" ", "", nil]
    attributes.each do |var|
      if empty.any? { |e| self.send("#{var}") == e}
        self.send(("#{var}="), "N/A")
      end
    end
  end

end
