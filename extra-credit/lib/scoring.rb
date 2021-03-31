class Scoring
  def self.calculate(dice)
    score = 0
    dice.each do |number|
      score += 100 if number == 1
      score += 50 if number == 5
    end
    return score
  end
end