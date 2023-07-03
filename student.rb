require 'pry'
require_relative 'person'

class Student < Person
  def initialize(age, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
  end

  def play_hooky
    'I love studying!'
  end
end
