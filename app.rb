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
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'List of all people:'
    people.each do |person|
      designation = person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Designation: #{designation}"
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

  def create_rental(person_id, _book_index)
    person = find_person_by_id(person_id)

    if person
      puts 'List of available books:'
      books.each_with_index do |book, index|
        puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
      end

      print 'Enter the index of the book to rent: '
      selected_index = gets.chomp.to_i - 1

      if selected_index >= 0 && selected_index < books.length
        book = books[selected_index]
        rental = Rental.new(book, person)
        rentals << rental
        "Rental created successfully. Person: #{person.name}, Book: #{book.title}"
      else
        'Invalid book index.'
      end
    else
      'Invalid person ID.'
    end
  end

  def list_rentals_by_person_id(person_id)
    person = find_person_by_id(person_id)

    if person
      person_rentals = rentals.select { |rental| rental.person == person }
      output = "List of rentals for Person ID #{person_id}:\n"
      person_rentals.each do |rental|
        output += "Book: #{rental.book.title}, Date: #{rental.date}\n"
      end
      output
    else
      'Invalid person ID.'
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
