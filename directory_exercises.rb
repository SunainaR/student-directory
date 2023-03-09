def input_students
  puts "Please enter the names:"
  puts "To finish, just hit return twice"
  students = []
  name = gets.gsub("\n", "")
  while !name.empty? do
    students << {name: name, cohort: :november}
    students.count == 1 ? (puts "Now we have #{students.count} student") : (puts "Now we have #{students.count} students")
    name = gets.gsub("\n", "")
    # strip removes leading and trailing whitespace
  end
  students
end

=begin
input_students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :december},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :december},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :december},
  {name: "Norman Bates", cohort: :november}
]
=end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print(students)
  # Try again with .map instead:
  # puts students.map { |student| student[:cohort] }
  grouped_students = students.group_by{|student| student[:cohort]}
  grouped_students.each do |cohort, students|
    puts "Student in the #{cohort} cohort:".center(80)
    students.each do |student|
      puts student[:name].center(80)
    end
    puts "\n"
  end 
=begin
  students.each do |student|
    puts "#{students[:name]} (#{students[:cohort]} cohort)".center(80)
  end
=end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(80)
end

# nothing will happen until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
# Need to use name as argument and pass the student variable to the methods
# Methods don't have access to local variables defined outside of them