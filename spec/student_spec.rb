require './lib/student'

RSpec.describe Student do
  describe '#initialize' do
    it 'exists' do
      student_1 = Student.new({name: "Morgan", age: 21})

      expect(student_1.name).to eq("Morgan")
      expect(student_1.age).to eq(21)
      expect(student_1.scores).to eq([])
    end
  end

  describe "#log_score" do
    it 'adds score to student' do
      student_1 = Student.new({name: "Morgan", age: 21})

      student_1.log_score(89)
      student_1.log_score(78)
      expect(student_1.scores).to eq([89, 78])
    end
  end

  describe '#grade' do
    it 'averages all logged scores' do
      student_1 = Student.new({name: "Morgan", age: 21})

      student_1.log_score(89)
      student_1.log_score(78)
    end
  end
end