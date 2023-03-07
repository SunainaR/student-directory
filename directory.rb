student_count = 11
# put students into array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# Easier to see what is going on with methods
# Reads more like English

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing will happen until we call the methods
print_header
print(students)
print_footer(students)
# Need to use name as argument and pass the student variable to the methods
# Methods don't have access to local variables defined outside of them