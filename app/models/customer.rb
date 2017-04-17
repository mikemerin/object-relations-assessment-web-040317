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
