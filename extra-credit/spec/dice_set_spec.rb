require 'dice_set'

RSpec.describe DiceSet do
  describe '#roll' do
    subject { described_class }

    it 'returns a random number between 1 and 6 for a single die' do
      expect(subject.roll).to be_between(1, 6)
    end

    it 'will not return a value outside the range of the die' do
      expect(subject.roll).not_to be > 6
      expect(subject.roll).not_to be < 1
    end
  end
end