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
