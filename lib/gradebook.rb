class Gradebook

  attr_reader :instructor
  
  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def all_students
    @courses.students
  end

  def below_grade
    @courses.students.grade < theshold
  end
end