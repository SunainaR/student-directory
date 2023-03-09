def interactive_menu
  # declared student variable outside loop so persists across several interations of the loop
  students = []
  # 1. print the menu and ask the user what to do
  # 2. read the input and save it to a variable
  # 3. do what the user asked
  # 4. repeat from step 1
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        # input students
        students = input_students
      when "2"
        # show students
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # This will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

# Easier to see what is going on with methods
# Reads more like English

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

interactive_menu