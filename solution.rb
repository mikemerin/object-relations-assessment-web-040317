class Customer

  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
    ALL << self
  end

  def self.all() ALL end

  def self.find_by_name(name)
    ALL.find { |person| "#{person.first_name} #{person.last_name}" == name }
  end

  def self.find_all_by_first_name(name)
    ALL.select { |person| person.first_name == name }
  end

  def self.all_names
    ALL.map { |person| "#{person.first_name} #{person.last_name}" }
  end

  def add_review(content, restaurant)

    Review.new(content, self.full_name, restaurant)

  end

  def full_name() "#{first_name} #{last_name}" end

end


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


class Review

  attr_accessor :text, :customer, :restaurant

  ALL = []

  def initialize(review, customer, restaurant)
    @review, @customer, @restaurant = review, customer, restaurant
    ALL << self
  end

  def self.all() ALL end

  def customer

    # returns the customer for that given review
    self.map { |review| review.customer }

  end

  def restaurant

    self.map { |review| review.restaurant }

  end

end
