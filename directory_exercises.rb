def input_students
  puts "Please enter the names and then hobbies of the students "
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  cohort = gets.chomp.to_s
  while !name.empty? do
# default cohort value
    if cohort == ""
      cohort = :november
    end
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp.to_s
  end
  students
end

# Easier to see what is going on with methods
# Reads more like English

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end
# each_with_index added
def print(students)
  counter = 0
  until counter == students.length
    puts "#{counter + 1}.#{students[counter][:name]} (#{students[counter][:cohort]} cohort)".center(80)
    counter += 1
  end
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