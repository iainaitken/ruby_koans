class Scoring
  @@score = 0
  
  def self.calculate(dice)
    @@score = 0
    if triple?(dice)
      score_triple(dice)
    else
      dice.each do |number|
        @@score += 100 if number == 1
        @@score += 50 if number == 5
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
    @@score += 1000 if dice == [1, 1, 1]
    @@score += 200 if dice == [2, 2, 2]
  end
end