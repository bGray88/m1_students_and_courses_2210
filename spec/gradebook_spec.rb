require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  describe 'initialize' do
    it 'exists' do
      gradebook = Gradebook.new("Jim")

      expect(gradebook).to be_instance_of(Gradebook)
    end

    it 'has a name, capacity, and no students upon creation' do
      gradebook = Gradebook.new("Jim")

      expect(gradebook.instructor).to eq("Jim")
    end
  end

  describe '#all_students' do
    it "can provide all students in courses collection" do
      gradebook = Gradebook.new("Jim")
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course.enroll(student1)
      course.enroll(student2)

      gradebook.add_course(course)

      expect(gradebook.courses).to eq()
    end
  end
end