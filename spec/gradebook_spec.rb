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

  describe '#add_course' do
    it "add course to gradebook" do
      gradebook = Gradebook.new("Jim")
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course.enroll(student1)
      course.enroll(student2)

      gradebook.add_course(course)

      expect(gradebook.courses).to be_instance_of(Hash)
    end
  end

  describe '#list_courses' do
    it "list all courses in gradebook" do
      gradebook = Gradebook.new("Jim")
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course.enroll(student1)
      course.enroll(student2)

      gradebook.add_course(course)

      expect(gradebook.list_courses).to eq("Calculus")
    end
  end

  describe '#all_students' do
    it "can provide all students in list format" do
      gradebook = Gradebook.new("Jim")
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course.enroll(student1)
      course.enroll(student2)

      gradebook.add_course(course)

      expect(gradebook.all_students).to eq("Morgan, Jordan")
    end
  end

  describe '#below_grade' do
    it "can provide all students below grade threshold specified in list format" do
      gradebook = Gradebook.new("Jim")
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Michelle", age: 25})

      course.enroll(student1)
      course.enroll(student2)
      course.enroll(student3)

      student1.log_score(61)
      student2.log_score(75)
      student3.log_score(55)

      gradebook.add_course(course)

      expect(gradebook.below_grade(70)).to eq("Morgan, Michelle")
    end
  end

  describe '#all_grades' do
    it "list students grade across all courses" do
      gradebook = Gradebook.new("Jim")
      course1 = Course.new("Calculus", 2)
      course2 = Course.new("Biology", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Michelle", age: 25})

      course1.enroll(student1)
      course2.enroll(student2)
      course1.enroll(student3)

      student1.log_score(61)
      student2.log_score(75)
      student3.log_score(55)

      gradebook.add_course(course1)
      gradebook.add_course(course2)

      expect(gradebook.all_grades).to eq("Calculus: Morgan 61.0, Calculus: Michelle 55.0, Biology: Jordan 75.0")
    end
  end
end