require_relative 'person'

class Decorator < Person
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
    person.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    person.correct_name.length > 10 ? person.correct_name[0..9] : person.correct_name
  end
end
