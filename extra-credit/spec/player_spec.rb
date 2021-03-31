require 'player'

RSpec.describe Player do
  subject { described_class.new(name: "Brian") }
  
  it 'stores the player name' do
    expect(subject.name).to eq("Brian")
  end
end