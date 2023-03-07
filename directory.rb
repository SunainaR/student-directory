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
# Print list of students
students.each do |student|
  puts student
end
# We print the total number of students
puts "Overall, we have #{students.count} great students"