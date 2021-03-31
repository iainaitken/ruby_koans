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
    triple = check_triple(dice)
    if triple != 0
      score_triple(triple)
    else
      dice.each do |number|
        @@score += SCORE_TABLE[number]
      end
    end
    return @@score
  end

  private

  def self.check_triple(dice)
    score_hash = dice.each_with_object(Hash.new(0)) { |number, hash| hash[number] += 1 }
    triple = score_hash.select { |key, value| value >= 3 }
    if triple != {}
      return Array.new(3) { triple.keys.pop }
    else
      return 0
    end
  end

  def self.score_triple(triple)
    @@score += SCORE_TABLE[triple]
  end
end