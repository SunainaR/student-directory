def input_students
  puts "Please enter the names and then hobbies of the students "
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  hobby = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    hobby = gets.chomp
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
    puts "#{counter + 1}.#{students[counter][:name]} from #{students[counter][:cohort]} cohort and enjoys #{students[counter][:hobby]}".center(80)
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