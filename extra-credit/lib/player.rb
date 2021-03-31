class Player
  attr_reader :name, :score
  
  def initialize(name:)
    @name = name
    @score = 0
  end

  def add_score(round_score)
    @score += round_score
  end
end