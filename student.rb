require_relative 'person'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission = true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = nil
  end

  def assign_classroom(classroom)
    @classroom = classroom
  end

  def classroom
    @classroom
  end
end
