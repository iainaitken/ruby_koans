require 'dice_set'

RSpec.describe DiceSet do
  describe '#roll' do
    subject { described_class }

    it 'returns a random number between 1 and 6 for a single die' do
      expect(subject.roll(1).first).to be_between(1, 6)
    end

    it 'can return values for more than one dice' do
      expect(subject.roll(2)).to be_a(Array)
      expect(subject.roll(2).sum).to be_between(2, 12)
    end
  end
end