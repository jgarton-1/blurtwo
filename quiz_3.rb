class Person
  attr_accessor :age, :name
  def initialize(age, name)
    @age = age
    @name = name
  end
  def output_person
    puts "Hello, I'm #{@name} and I'm #{@age} years old"
  end
end
class Student < Person
  attr_accessor :major, :gpa
  def initialize(age, name, major, gpa)
    @major = major
    @gpa = gpa
    super(age, name)
  end
  def output_student
    puts "My major is #{@major} and my GPA is #{@gpa}"
  end
end
person = Person.new(25, "John")
student = Student.new(25, "John", "Computer Science", 4)
person.output_person
student.output_student
student.output_person

function mf(a,b,func){
  return func.apply(func, [a,b])
}

mf(3,5, function(a,b) { return a/b; });
(function(a,b){ return a/b + 1;}).apply(null, [3,5]);
(function(a,b){ return a/b + 2;})(3,5);