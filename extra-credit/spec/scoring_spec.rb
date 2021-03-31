require 'scoring'

RSpec.describe Scoring do
  describe '.calculate' do
    subject { described_class }

    it 'calculates a zero score' do
      roll = 4
      expect(subject.calculate([roll])).to eq(Scoring::SCORE_TABLE[roll])
    end

    it 'calculates the score for a roll of 1' do
      roll = 1
      expect(subject.calculate([roll])).to eq(Scoring::SCORE_TABLE[roll])
    end

    it 'calculates the score for a roll of 5' do
      roll = 5
      expect(subject.calculate([roll])).to eq(Scoring::SCORE_TABLE[roll])
    end

    it 'calculates scores for a roll of more than one die' do
      expect(subject.calculate([5, 5, 4, 2, 6])).to eq(100)
      expect(subject.calculate([1, 5, 1, 2, 6])).to eq(250)
    end

    it 'calculates a triple score' do
      roll = [1, 1, 1]
      expect(subject.calculate(roll)).to eq(Scoring::SCORE_TABLE[roll])

      roll = [2, 2, 2]
      expect(subject.calculate(roll)).to eq(Scoring::SCORE_TABLE[roll])
 
      roll = [3, 3, 3]
      expect(subject.calculate(roll)).to eq(Scoring::SCORE_TABLE[roll])

      roll = [4, 4, 4]
      expect(subject.calculate(roll)).to eq(Scoring::SCORE_TABLE[roll])

      roll = [5, 5, 5]
      expect(subject.calculate(roll)).to eq(Scoring::SCORE_TABLE[roll])

      roll = [6, 6, 6]
      expect(subject.calculate(roll)).to eq(Scoring::SCORE_TABLE[roll])
    end

    it 'calculates a triple score where there is a roll of more than 3 numbers' do
      expect(subject.calculate([1, 1, 1, 1])).to eq(1000)
    end

    it 'calculates a triple score where there is a triple roll and a non-scoring number' do
      expect(subject.calculate([1, 1, 1, 4])).to eq(1000)
    end

    it 'calculates the score where there is a triple roll and a scoring number' do
      expect(subject.calculate([2, 2, 2, 5])).to eq(250)
    end
  end
end