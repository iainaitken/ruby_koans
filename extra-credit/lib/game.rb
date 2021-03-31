class Game
  def initialize
    @players = []
  end

  def add_player(name:)
    @players.push(Player.new(name: name))
  end

  def list_players
    @players.map { |player| player.name }
  end
end
