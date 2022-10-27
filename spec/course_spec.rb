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
end