class Game
  def initialize(player_class = Player, dice_set_class = DiceSet)
    @players = []
    @player_class = player_class
    @dice_set_class = dice_set_class
  end

  def turn_loop(player:)
    rolls = @dice_set_class.roll(5)
    score = Scoring.calculate(rolls)
    if score = 0
      "Turn over"
    end
  end

  def add_player(name:)
    @players.push(@player_class.new(name: name))
  end

  def list_players
    @players.map { |player| player.name }
  end

  def roll(no_of_dice:)
    @dice_set_class.roll(no_of_dice)
  end

  def scorecard
    scores = {}
    @players.each do |player|
      scores[player.name.to_sym] = player.score
    end
    return scores
  end
end

=begin
Play Loop  

Player 1 rolls - game.roll
Calculate score - scoring.calculate
End turn if zero points
Work out how many dice available in the next throw. NOTE: if all dice are scoring 
after the player has thrown all dice (i.e. first throw gives 1-1-1, second gives a  
5 and the third gives a 1) then the player can throw again with 5 dice.
Option to quit and take score (if already in the game or if score > 300)
Check if score >= 3000
If so, Final round - all other players take one more turn 
=end
