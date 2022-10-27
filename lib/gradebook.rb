require './lib/student'
require './lib/course'

class Gradebook

  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = Hash.new {|course, students| course[students] = []}
  end

  def add_course(course)
    @courses[course.name] += course.students
  end

  def list_courses
    @courses.keys.join(", ")
  end

  def all_students
    @courses.map {|course, students| students}
  end

  def below_grade(threshold)
    @courses.students.select {|student| student.grade < threshold}
  end
end