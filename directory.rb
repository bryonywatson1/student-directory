@students = []
def input_students
  #students = []
  #get the first name
  #Get the first name
  cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp

  while !name.empty? do#This is to do with entering twice
    puts "Please enter the hobbies of the students"
    puts "To finish, just hit return 4 times"
    hobbies = gets.chomp
    puts "Please enter the country of the students"
    puts "To finish, just hit return 4 times"
    country = gets.chomp
    puts "Please enter the cohort of the students"
    puts "To finish, just hit return 4 times"
    cohort = gets.chomp.capitalize
      if (cohorts.include? cohort) == false
        cohort = "Unknown"
      end
    @students << {name: name, hobbies: hobbies, country: country, cohort: cohort} #import part of the  code.
      if @students.count == 1
      puts "Now we have #{@students.count} student".center(40)
      else
      puts "Now we have #{@students.count} students"
      end
    puts "Please enter another name: "
    name = gets.chomp
  end
  @students
end


def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(40)
  else puts "Overall, we have #{@students.count} great students".center(40)
  end
end

def print_students_list
  counter = 0
  while counter < @students.count
    @students = @students.sort_by { |k| k[:cohort]}
    student = @students[counter]
    puts "#{student[:name]} (#{student[:cohort]} cohort, they like #{student[:hobbies]}, and they come from #{student[:country]})".center(40)
    counter += 1
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit #this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" #9 because we'll be adding more items
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:country]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#students = input_students
interactive_menu
show_students
#print_header
#print(students)
#print_footer(students)
