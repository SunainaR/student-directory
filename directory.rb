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
  end
end

# loading data from file automatically on startup
def load_students (filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from command line
  return if filename.nil? # leave the method if it isn't given
  if File.exists?(filename) # if the file exists
    # run the load students method with the filename as an argument
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # This will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end



def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
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

try_load_students
interactive_menu