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
    remaining_rolls = remove_triple(dice)
    remaining_rolls.each do |number|
      @@score += SCORE_TABLE[number]
    end
    return @@score
  end

  private

  def self.remove_triple(dice)
    score_hash = dice.each_with_object(Hash.new(0)) { |number, hash| hash[number] += 1 }
    triple_number = score_hash.select { |key, value| value >= 3 }.keys.pop
    if triple_number != nil
      score_triple(triple_number)
      3.times { dice.delete_at(dice.index(triple_number)) }
    end
    return dice
  end

  def self.score_triple(triple)
    triple_rolls = Array.new(3) { triple }
    @@score += SCORE_TABLE[triple_rolls]
  end
end