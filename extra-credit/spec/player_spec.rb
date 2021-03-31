require 'player'

RSpec.describe Player do
  subject { described_class.new(name: "Brian") }
  
  it 'stores the player name' do
    expect(subject.name).to eq("Brian")
  end

  it 'stores the player score' do
    expect(subject.score).to eq(0)
  end

  describe '#add_score' do
    it 'adds a score from a round to the player score' do
      subject.add_score(300)
      expect(subject.score).to eq(300)
    end
  end
end