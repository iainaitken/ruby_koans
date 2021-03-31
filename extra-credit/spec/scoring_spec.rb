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

    it 'calculates scores for a roll of more than one die' do
      expect(subject.calculate([5, 5, 4, 2, 6])).to eq(100)
      expect(subject.calculate([1, 5, 1, 2, 6])).to eq(250)
    end

    it 'calculates a triple score' do
      expect(subject.calculate([1, 1, 1])).to eq(1000)
      # expect(subject.calculate([2, 2, 2])).to eq(200)
      # expect(subject.calculate([3, 3, 3])).to eq(300)
      # expect(subject.calculate([4, 4, 4])).to eq(400)
      # expect(subject.calculate([5, 5, 5])).to eq(500)
      # expect(subject.calculate([6, 6, 6])).to eq(600)
    end
  end
end