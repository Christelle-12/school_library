require './person'

class Teacher < Person
  def initialize(specialization, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    super
    true
  end
end
teacher = Teacher.new('Physics', 14, name: 'Lucas')
puts teacher.can_use_services?
