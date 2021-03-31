require 'scoring'

RSpec.describe Scoring do
  describe '.calculate' do
    subject { described_class }

    it 'calculates a zero score' do
      expect(subject.calculate([4])).to eq(0)
    end

    it 'calculates the score for a roll of 1' do
      expect(subject.calculate([1])).to eq(100)
    end

    it 'calculates the score for a roll of 5' do
      expect(subject.calculate([5])).to eq(50)
    end
  end
end