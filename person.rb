class Person
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    name
  end

  def add_rental(rental)
    rentals << rental
  end

  private

  def of_age?
    age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
