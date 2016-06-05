# Create a parent Person class
class Person
  def initialize(name)
    @name = name
  end

# Greeting method for Student and Instructor
  def greeting
    puts "Hi, my name is #{@name}!"
  end
end

# Create class Student
class Student < Person
  def learn
    puts "I get it!"
  end
end

# Create class Instructor
class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

#Create an instance of Instructor whose name is "Chris"
chris = Instructor.new("Chris")
# Call his greeting
chris.greeting

# Create an instance of Student whose name is "Cristina"
cristina = Student.new("Cristina")
# Call his greeting)
cristina.greeting

# Call the teach method on your instructor instance
# Call the learn method on your student.

chris.teach
cristina.learn

#This doesn't work because Cristina is an instance of Student;
#and teach is a method inside Instructor.(The same for Chris)
#If these methods were in Person (parent class) it will work.
chris.learn
cristina.teach
