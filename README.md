##Iteration I

Use TDD to create a Student class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/student'
# => true

pry(main)> student = Student.new({name: "Morgan", age: 21})    
# => #<Student:0x00007fe196b0c050...>

pry(main)> student.name
# => "Morgan"

pry(main)> student.age
# => 21

pry(main)> student.scores
# => []

pry(main)> student.log_score(89)

pry(main)> student.log_score(78)    

pry(main)> student.scores
# => [89, 78]

pry(main)> student.grade #Average of all the scores
# => 83.5
```

## Iteration II
Use TDD to create a Course class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/course'
# => true

pry(main)> require './lib/student'
# => true

pry(main)> course = Course.new("Calculus", 2)    
# => #<Course:0x00007fa0a69be328...>

pry(main)> course.name
# => "Calculus"

pry(main)> course.capacity
# => 2

pry(main)> course.students
# => []

pry(main)> course.full?
# => false

pry(main)> student1 = Student.new({name: "Morgan", age: 21})
# => #<Student:0x00007fa0a80ae588...>

pry(main)> student2 = Student.new({name: "Jordan", age: 29})    
# => #<Student:0x00007fa0a814f4d8...>

pry(main)> course.enroll(student1)    

pry(main)> course.enroll(student2)    

pry(main)> course.students
# => [#<Student:0x00007fa0a80ae588...>, #<Student:0x00007fa0a814f4d8...>]

pry(main)> course.full?
# => true
```
