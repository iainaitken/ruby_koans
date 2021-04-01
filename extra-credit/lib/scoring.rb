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
  @@triple_number = nil
  
  def self.calculate(dice)
    reset_state
    if triple?(dice)
      dice = remove_and_score_triple(dice)
    end
    dice.each do |number|
      @@score += SCORE_TABLE[number]
    end
    return @@score
  end
  
  private
  
  def self.triple?(dice)
    score_hash = dice.each_with_object(Hash.new(0)) { |number, hash| hash[number] += 1 }
    @@triple_number = score_hash.select { |key, value| value >= 3 }.keys.pop
    return true if @@triple_number != nil
  end
  
  def self.remove_and_score_triple(dice)
    triple = Array.new(3) { dice.delete_at(dice.index(@@triple_number)) }
    @@score += SCORE_TABLE[triple]
    return dice
  end
  
  def self.reset_state
    @@score = 0
    @@triple_number = nil
  end
end