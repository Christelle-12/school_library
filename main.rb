require_relative 'app'
require 'pry'

def main_menu(_app)
  puts "\nWelcome to the Library Management System!"
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals'
  puts '7. Quit'
  print 'Enter your choice: '
end

def handle_choice(app, choice)
  actions = {
    1 => :handle_list_all_books,
    2 => :handle_list_all_people,
    3 => :handle_create_person,
    4 => :handle_create_book,
    5 => :handle_create_rental,
    6 => :handle_list_rentals,
    7 => :exit_app
  }

  action = actions[choice]

  if action
    send(action, app)
  else
    puts 'Invalid choice. Please try again.'
  end
end

def handle_list_all_books(app)
  # Introduce a bug: Use incorrect method name
  app.list_all_boooks
end

def handle_list_all_people(app)
  app.list_all_people
end

def handle_create_person(app)
  print 'Enter person name: '
  name = gets.chomp
  print 'Enter person age: '
  age = gets.chomp.to_i
  print 'Enter person role (student/teacher): '
  role = gets.chomp.downcase
  app.create_person(name, age, role)
end

def handle_create_book(app)
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter book author: '
  author = gets.chomp
  app.create_book(title, author)
end

def handle_create_rental(app)
  print 'Select a person from the following list by number: '
  app.list_all_people
  person_index = gets.chomp.to_i - 1

  if person_index >= 0 && person_index < app.people.length
    print 'Select a book from the following list by number: '
    app.list_all_books
    book_index = gets.chomp.to_i - 1

    if book_index >= 0 && book_index < app.books.length
      app.create_rental(person_index, book_index)
    else
      puts 'Invalid book index.'
    end
  else
    puts 'Invalid person index.'
  end
end

def handle_list_rentals(app)
  puts 'List of rentals:'
  app.rentals.each_with_index do |rental, index|
    book = rental.book
    person = rental.person
    rental_info = "#{index + 1}. Person: #{person.name}"
    rental_info += ", Book: #{book.title}, Author: #{book.author}, Rental Date: #{rental.date}"
    puts rental_info
  end
end

def exit_app(_ = nil)
  puts 'Thank you for using the Library Management System. Goodbye!'
end

def main
  app = App.new

  loop do
    main_menu(app)
    choice = gets.chomp.to_i

    binding.pry if choice == 0  # Insert Pry binding here

    handle_choice(app, choice)

    break if choice == 7
  end
end

main
