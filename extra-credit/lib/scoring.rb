class Scoring
  SCORE_TABLE = {
    1 => 100,
    2 => 0,
    3 => 0,
    4 => 0,
    5 => 50,
    6 => 0,
    [1, 1, 1] => 1000,
    [2, 2, 2] => 200,
    [3, 3, 3] => 300,
    [4, 4, 4] => 400,
    [5, 5, 5] => 500,
    [6, 6, 6] => 600,
  }
  @@score = 0
  
  def self.calculate(dice)
    @@score = 0
    if triple?(dice)
      score_triple(dice)
    else
      dice.each do |number|
        @@score += SCORE_TABLE[number]
      end
    end
    return @@score
  end

  private

  def self.triple?(dice)
    score_hash = dice.each_with_object(Hash.new(0)) { |number, hash| hash[number] += 1 }
    return true if score_hash.has_value?(3)
  end

  def self.score_triple(dice)
    @@score += SCORE_TABLE[dice]
  end
end