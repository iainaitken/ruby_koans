class DiceSet
  def self.roll(dice)
    Array.new(dice) { rand(1..6) }
  end
end