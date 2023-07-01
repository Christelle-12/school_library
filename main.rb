require_relative 'app'

# Entry point of the console app
def main
  app = App.new

  loop do
    puts "\nWelcome to the Library Management System!"
    puts "Please choose an option:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a person"
    puts "7. Quit"

    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      print "Enter person name: "
      name = gets.chomp
      print "Enter person age: "
      age = gets.chomp.to_i
      print "Enter person role (student/teacher): "
      role = gets.chomp.downcase
      app.create_person(name, age, role)
    when 4
      print "Enter book title: "
      title = gets.chomp
      print "Enter book author: "
      author = gets.chomp
      app.create_book(title, author)
    when 5
      print "Enter person ID: "
      person_id = gets.chomp.to_i
      print "Enter book title: "
      book_title = gets.chomp
      app.create_rental(person_id, book_title)
    when 6
      print "Enter person ID: "
      person_id = gets.chomp.to_i
      app.list_rentals_by_person_id(person_id)
    when 7
      puts "Thank you for using the Library Management System. Goodbye!"
      break
    else
      puts "Invalid choice. Please try again."
    end
  end
end

# Invoke the main method to start the app
main
