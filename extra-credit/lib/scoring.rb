class Scoring
  def self.calculate(dice)
    score = 0
    if dice == [1, 1, 1]
      score += 1000
    else
      dice.each do |number|
        score += 100 if number == 1
        score += 50 if number == 5
      end
    end
    return score
  end
end