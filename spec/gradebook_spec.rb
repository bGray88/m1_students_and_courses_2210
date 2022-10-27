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

      expect(gradebook.instructor).to be_instance_of(Gradebook)
    end
  end