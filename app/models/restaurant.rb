class Restaurant

  attr_accessor :name

  ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all() ALL end

  def self.find_by_name(name)
    ALL.find { |restaurant| restaurant.name == name }
  end

  def reviews

    Review.all.select { |review| review.restaurant == self.name }

  end

  def customers

    self.reviews.map { |review| review.customer }
    # should return all of the customers who have written reviews of that restaurant.

  end

end
