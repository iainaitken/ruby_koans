require 'game'

RSpec.describe Game do
  subject { described_class.new }
  
  describe '#add_player' do
    let(:player) { instance_double(Player, name: "Brian") }
    
    before do
      allow(Player).to receive(:new).and_return(player)
    end
    
    it 'adds a player to the game' do
      subject.add_player(name: "Brian")
      
      expect(subject.list_players).to eq(["Brian"])
    end
  end
end