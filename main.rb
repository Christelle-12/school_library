require_relative 'person'
require_relative 'decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, name: 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

classroom = Classroom.new('Class A')
student = Student.new(classroom, 'John Doe')
book = Book.new('Ruby', 'Chris')
rental = Rental.new('2023-06-30', book, person)

puts "Classroom label: #{classroom.label}"
puts "Student name: #{student.name}"
puts "Book title: #{book.title} by #{book.author}"
puts "Rental date: #{rental.date}"
puts "Person name: #{person.name}"
puts "Person's rentals: #{person.rentals.map { |rental| rental.book.title }}"
