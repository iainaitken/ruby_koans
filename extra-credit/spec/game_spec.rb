require 'game'

RSpec.describe Game do
  subject { described_class.new }

  let(:player1) { instance_double(Player, name: "Brian", score: 400) }
  let(:player2) { instance_double(Player, name: "Kevin", score: 250) }
  let(:player3) { instance_double(Player, name: "Norma", score: 3200) }

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

  describe 'turn_loop' do
    
    before do
      @dice = class_double(DiceSet).as_stubbed_const
      @scoring = class_double(Scoring).as_stubbed_const
    end
    
    it 'ends the turn if player scores a zero' do
      allow(@dice).to receive(:roll).and_return([2, 2, 3, 4, 6])
      allow(@scoring).to receive(:calculate).and_return([0, [2, 2, 3, 4, 6]])
      allow($stdin).to receive(:gets).and_return("n")

      expect(@dice).to receive(:roll).exactly(1).times
      expect(@scoring).to receive(:calculate).exactly(1).times
      expect(player1).not_to receive(:add_score)

      subject.turn_loop(player: player1)
    end

    it 'calculates if a player has another turn' do
      allow(@dice).to receive(:roll).and_return([1, 1, 1, 4, 6], [1, 3], [4])
      allow(@scoring).to receive(:calculate).and_return([1000, [4, 6]], [100, [3]], [0, [4]])
      allow($stdin).to receive(:gets).and_return("n")

      expect(@dice).to receive(:roll).exactly(3).times
      expect(@scoring).to receive(:calculate).exactly(3).times
      expect(player1).not_to receive(:add_score)

      subject.turn_loop(player: player1)
    end

    it 'resets the rolls if all dice are scoring' do
      allow(@dice).to receive(:roll).and_return([1, 1, 1, 4, 6], [1, 3], [5], [2, 2, 2, 3, 6], [2, 4])
      allow(@scoring).to receive(:calculate).and_return([1000, [4, 6]], [100, [3]], [50, []], [200, [3, 6]], [0, [2, 4]])
      allow($stdin).to receive(:gets).and_return("n")

      expect(@dice).to receive(:roll).exactly(5).times
      expect(@scoring).to receive(:calculate).exactly(5).times
      expect(player1).not_to receive(:add_score)

      subject.turn_loop(player: player1)
    end

    it 'allows the player to collect points' do
      allow(@dice).to receive(:roll).and_return([1, 1, 1, 4, 6])
      allow(@scoring).to receive(:calculate).and_return([1000, [4, 6]])
      allow($stdin).to receive(:gets).and_return("y")
      
      expect(@dice).to receive(:roll).exactly(1).times
      expect(@scoring).to receive(:calculate).exactly(1).times
      expect(player1).to receive(:add_score).exactly(1).times

      subject.turn_loop(player: player1)
    end
  end

  describe '#final_turn_loop' do
    it 'allows only the other players in the game to have a final turn' do
      
    end
  end
end