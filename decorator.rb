require_relative 'person'

class Decorator
  attr_accessor :person

  def initialize(person)
    @person = person
  end

  def correct_name
    person.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = super
    name.length > 10 ? name[0..9] : name
  end
end
