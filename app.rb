require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'List of all people:'
    people.each_with_index do |person, index|
      designation = person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "#{index + 1}. ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Designation: #{designation}"
    end
  end

  def create_person(name, age, role, _classroom = nil)
    if role == 'student'
      person = Student.new(age, name: name)
    elsif role == 'teacher'
      puts 'Enter teacher specialization:'
      specialization = gets.chomp
      person = Teacher.new(age, specialization: specialization, name: name)
    else
      return "Invalid role. Please choose 'student' or 'teacher'."
    end

    people << person
    "Person created successfully. ID: #{person.id}, Name: #{person.name}"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    books << book
    "Book created successfully. Title: #{book.title}, Author: #{book.author}"
  end

  def create_rental(person_index, book_index)
    person = people[person_index - 1]
    book = books[book_index - 1]
    date = Time.now
  
    rental = Rental.new(date, book, person)
    rentals << rental
  
    puts 'Rental created successfully!'
  end
  

  def list_rentals_by_person_id(person_id)
    person = @people.find { |p| p.id == person_id }
    if person
      person.list_rentals
    else
      puts "Person not found."
    end
  end
  

  private

  def find_person_by_id(person_id)
    people.find { |person| person.id == person_id }
  end
end
