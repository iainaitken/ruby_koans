class Game
  def initialize(
    player_class = Player,
    dice_set_class = DiceSet,
    scoring_class = Scoring
  )
    @players = []
    @player_class = player_class
    @dice_set_class = dice_set_class
    @scoring_class = scoring_class
  end

  def game_loop
    @players.each do |player|
      turn_loop(player: player)
      break if final_turn?(player)
    end
  end

  def turn_loop(player:)
    dice = 5
    turn_score = 0
    loop do
      rolls = @dice_set_class.roll(dice)
      returned_array = @scoring_class.calculate(rolls)
      score = returned_array.first
      if score == 0
        return
      else
        turn_score += score
        loop do
          puts "Would you like to take your points and end your turn? y/n"
          selection = $stdin.gets.chomp
          if selection == "y"
            player.add_score(turn_score)
            return
          elsif selection == "n"
            break
          end
        end
      end
      if returned_array.last.length == 0
        dice = 5
      else
        dice = returned_array.last.length
      end
    end
  end

  # def exclude_player(player)
  #   @players.delete(player)

  # end

  def add_player(name:)
    @players.push(@player_class.new(name: name))
  end

  def list_players
    @players.map { |player| player.name }
  end

  private

  def roll(no_of_dice:)
    @dice_set_class.roll(no_of_dice)
  end

  def final_turn?(player)
    player.score >= 3000
  end
end

=begin
Play Loop  

Player 1 rolls - game.roll
Calculate score - scoring.calculate
End turn if zero points - done
Work out how many dice available in the next throw. NOTE: if all dice are scoring 
after the player has thrown all dice (i.e. first throw gives 1-1-1, second gives a  
5 and the third gives a 1) then the player can throw again with 5 dice. - done
Option to quit and take score (if already in the game or if score > 300) - done
Check if score >= 3000
If so, Final round - all other players take one more turn 
=end
