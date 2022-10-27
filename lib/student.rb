require 'pry'

class Student

  attr_reader :name, :age, :scores

  def initialize(student)
    @name = student[:name]
    @age  = student[:age]
    @scores = []
  end

  def log_score(num)
    @scores << num
  end

  def grade
    @scores.sum / 2.0
  end
end