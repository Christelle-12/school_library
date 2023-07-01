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
    puts "List of all books:"
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts "List of all people:"
    people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}"
    end
  end

  def create_person(name, age, role, classroom = nil)
    if role == "student"
      person = Student.new(classroom, name)
    elsif role == "teacher"
      person = Teacher.new(age, name: name)
    else
      puts "Invalid role. Please choose 'student' or 'teacher'."
      return
    end

    people << person
    puts "Person created successfully. ID: #{person.id}, Name: #{person.name}"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    books << book
    puts "Book created successfully. Title: #{book.title}, Author: #{book.author}"
  end

  def create_rental(person_id, book_title)
    person = find_person_by_id(person_id)
    book = find_book_by_title(book_title)

    if person && book
      rental = Rental.new(book, person)
      rentals << rental
      puts "Rental created successfully. Person: #{person.name}, Book: #{book.title}"
    else
      puts "Invalid person ID or book title."
    end
  end

  def list_rentals_by_person_id(person_id)
    person = find_person_by_id(person_id)

    if person
      person_rentals = rentals.select { |rental| rental.person == person }
      puts "List of rentals for Person ID #{person_id}:"
      person_rentals.each do |rental|
        puts "Book: #{rental.book.title}, Date: #{rental.date}"
      end
    else
      puts "Invalid person ID."
    end
  end

  private

  def find_person_by_id(person_id)
    people.find { |person| person.id == person_id }
  end

  def find_book_by_title(book_title)
    books.find { |book| book.title == book_title }
  end
end
