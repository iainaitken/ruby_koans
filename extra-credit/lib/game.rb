class Game
  def initialize(player_class = Player)
    @players = []
    @player_class = player_class
  end

  def add_player(name:)
    @players.push(@player_class.new(name: name))
  end

  def list_players
    @players.map { |player| player.name }
  end

  def scorecard
    scores = {}
    @players.each do |player|
      scores[player.name.to_sym] = player.score
    end
    return scores
  end
end
