=begin
Interactive Menu Process:
1. print the menu and ask the user what to do
2. read the input and save it to a variable
3. do what the user asked
4. repeat from step 1

from command line with input file specified:
ruby directory.rb students.csv
=end

# instance variable decalred here so it is accessible in all methods
@students = []
def interactive_menu
  loop do
    print_menu
    # Note that we're passing the user selection as an argument to the method
    process(STDIN.gets.chomp)
    puts
  end
end
=begin
1) After we added the code to load the students from file,
we ended up with adding the students to @students in two places. 
The lines in load_students() and input_students() are almost the same. 
This violates the DRY (Don't Repeat Yourself) principle. 
How can you extract them into a method to fix this problem?
=end

=begin
3) Continue refactoring the code. Which method is a bit too long? 
What method names are not clear enough? 
Anything else you'd change to make your code look more elegant? Why?
=end

def process(selection)
  case selection
    when "1" then user_input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit # This will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from your file"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
=begin
3 continued => renaming and refactoring load_students_from_file
and check_file_exists to ensure methods do only one thing
=end
# loading data from file automatically on startup
def load_students (filename = "students.csv")
  check_file_exists
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
  puts "Loaded #{@students.count} from #{filename}"
end

=begin
2) How could you make the program load students.csv 
by default if no file is given on startup? 
Which methods would you need to change?
=end
def check_file_exists
  filename = ARGV.first # first argument from command line
  filename = "students.csv" if filename.nil?
  if File.exists?(filename) # if the file exists
    # run the load students method with the filename as an argument
    return filename
  else
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

def user_input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = "november"
  while !name.empty? do
    add_students(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

=begin
4) Right now, when the user choses an option from our menu, 
there's no way of them knowing if the action was successful. 
Can you fix this and implement feedback messages for the user?
=end
def save_students
  # open the file for writing - returns a reference to the file
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    # calling puts on file means will write there and not screen
    file.puts csv_line
  end
  file.close
  puts "Students were succesfully saved to students.csv"
end

=begin
def load_students
  file = File.open("students.csv", "r")
  #read lines inot an array and iterate over it
  file.readlines.each do |line|
  # parallel assignment of variables
  name, cohort = line.chomp.split(',')
  # Then store these values into a hash and set the instance variable
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
=end

load_students
interactive_menu