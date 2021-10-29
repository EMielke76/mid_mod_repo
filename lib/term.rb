class Term
  attr_reader :name,
              :courses

  def initialize(name)
    @name    = name
    @courses = []
  end

  def add_course(course)
    @courses.push(course)
  end

  def available_courses
    @courses.select do |course|
      course.full? == false
    end
  end

  def all_student_names
    @courses.map do |course|
      course.students.map do |student|
        student.name
      end
    end.flatten
  end

  def number_of_courses(student)
    student.enrolled_in
  end

  def scholarship_elligible(student)
    student.grade >= 90 && student.enrolled_in >=3
  end

  def tuition_owed(student)
    if scholarship_elligible(student)
      (number_of_courses(student) * 200.00) / 1.25
    else
      number_of_courses(student) * 200.00
    end.ceil(2).to_s.insert(0, "$")
  end
end
