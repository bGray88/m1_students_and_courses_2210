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
    @courses.map do |course, students| 
      students.map {|student| student.name}
    end.join(", ")
  end

  def below_grade(threshold)
    @courses.map do |course, students| 
      students.select do |student| 
        student.grade < threshold
      end
    end.flatten.map {|student| student.name}.join(", ")
  end

  def all_grades
    @courses.map do |course, students| 
      students.map do |student| 
        "#{student.name} #{student.grade}"
      end
    end.join(", ")
  end
end