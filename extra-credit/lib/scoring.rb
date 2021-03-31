class Scoring
  def self.calculate(dice)
    return 100 if dice[0] == 1
    return 50 if dice[0] == 5
    return 0
  end
end