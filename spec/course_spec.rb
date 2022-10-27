require './lib/student'
require './lib/course'

RSpec.describe Course do
  describe 'initialize' do
    it 'exists' do
      course = Course.new("Calculus", 2)

      expect(course).to be_instance_of(Course)
    end

    it 'has a name, capacity, and no students upon creation' do
      course = Course.new("Calculus", 2)

      expect(course.name).to eq("Calculus")
      expect(course.capacity).to eq(2)
      expect(course.students).to eq([])
    end
  end

  describe '#full?' do
    it 'checks capacity of course for full' do
      course = Course.new("Calculus", 2)

      expect(course.full?).to eq(false)
    end
  end

  describe '#enroll' do
    it 'adds student to course collection' do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      
      course.enroll(student1)
      course.enroll(student2)

      expect(course.full?).to eq(true)
    end
  end
end