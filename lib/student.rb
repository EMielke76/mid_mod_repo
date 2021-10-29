class Student
  attr_reader :name,
              :age,
              :scores
  attr_accessor :enrolled_in

  def initialize(attributes)
    @name   = attributes[:name]
    @age    = attributes[:age]
    @scores = []
    @enrolled_in = 0
  end

  def log_score(score)
    @scores << score
  end

  def grade
    @scores.sum / (@scores.count.to_f)
  end
end
