require 'game'

RSpec.describe Game do
  subject { described_class.new }
  let(:player1) { instance_double(Player, name: "Brian", score: 400) }
  let(:player2) { instance_double(Player, name: "Kevin", score: 250) }
  before do
    allow(Player).to receive(:new).with(name: "Brian").and_return(player1)
    allow(Player).to receive(:new).with(name: "Kevin").and_return(player2)
  end
  
  describe '#add_player' do



    
    it 'adds a player to the game' do
      subject.add_player(name: "Brian")
      
      expect(subject.list_players).to eq(["Brian"])
    end

    it 'can add more than one player' do
      subject.add_player(name: "Brian")
      subject.add_player(name: "Kevin")
      
      expect(subject.list_players).to eq ["Brian", "Kevin"]
    end
  end

  describe '#scorecard' do
    it 'shows the current scores' do
      subject.add_player(name: "Brian")
      subject.add_player(name: "Kevin")

      expect(subject.scorecard).to eq({Brian: 400, Kevin: 250})
    end
  end
end