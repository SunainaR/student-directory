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
# each_with_index added
def print(students)
  students.each_with_index do |student, index|
    if student[:name].start_with?("N")
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing will happen until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
# Need to use name as argument and pass the student variable to the methods
# Methods don't have access to local variables defined outside of them