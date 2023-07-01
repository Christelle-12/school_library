require_relative 'app'

def main_menu(_app)
  puts "\nWelcome to the Library Management System!"
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
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
  app.list_all_books
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
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  print 'Enter book title: '
  book_title = gets.chomp
  app.create_rental(person_id, book_title)
end

def handle_list_rentals(app)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  app.list_rentals_by_person_id(person_id)
end

def exit_app(_ = nil)
  puts 'Thank you for using the Library Management System. Goodbye!'
end

# Invoke the main method to start the app
def main
  app = App.new

  loop do
    main_menu(app)
    choice = gets.chomp.to_i
    handle_choice(app, choice)

    break if choice == 7
  end
end

main
