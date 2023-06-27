require "./person.rb"

class Teacher < Person
    def initialize(specialization,age, name ="unkown", parent_permission = true)
        super(age,name,parent_permission)
        @specialization =specialization
    end
    def can_use_services?
        true
    end
end
teacher = Teacher.new("Math", 10, "lucas")
puts teacher.can_use_services? 