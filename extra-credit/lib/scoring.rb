class Scoring
  def self.calculate(dice)
    if dice[0] == 1
      100
    elsif dice[0] == 5
      50
    else
      0
    end
  end
end