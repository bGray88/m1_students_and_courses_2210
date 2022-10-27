class Gradebook

  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = Hash.new {|course, students| course[students] = []}
  end

  def add_course(course)
    @course << course
  end

  def all_students
    @courses.students
  end

  def below_grade(threshold)
    @courses.students.select {|student| student.grade < threshold}
  end
end