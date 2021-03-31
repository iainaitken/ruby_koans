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

    it 'calculates a triple 1 roll' do
      roll = [1, 1, 1]
      expected_result = Scoring::SCORE_TABLE[roll]
      expect(subject.calculate(roll)).to eq(expected_result)
    end

    it 'calculates a triple 2 roll' do
      roll = [2, 2, 2]
      expected_result = Scoring::SCORE_TABLE[roll]
      expect(subject.calculate(roll)).to eq(expected_result)
    end

    it 'calculates a triple 3 roll' do
      roll = [3, 3, 3]
      expected_result = Scoring::SCORE_TABLE[roll]
      expect(subject.calculate(roll)).to eq(expected_result)
    end

    it 'calculates a triple 4 roll' do
      roll = [4, 4, 4]
      expected_result = Scoring::SCORE_TABLE[roll]
      expect(subject.calculate(roll)).to eq(expected_result)
    end

    it 'calculates a triple 5 roll' do
      roll = [5, 5, 5]
      expected_result = Scoring::SCORE_TABLE[roll]
      expect(subject.calculate(roll)).to eq(expected_result)
    end

    it 'calculates a triple 6 roll' do
      roll = [6, 6, 6]
      expected_result = Scoring::SCORE_TABLE[roll]
      expect(subject.calculate(roll)).to eq(expected_result)
    end

    it 'calculates a triple score where there is a roll of more than 3 numbers' do
      expect(subject.calculate([1, 1, 1, 1])).to eq(1100)
    end

    it 'calculates a triple score where there is a triple roll and a non-scoring number' do
      expect(subject.calculate([1, 1, 1, 4])).to eq(1000)
    end

    it 'calculates the score where there is a triple roll and a scoring number' do
      expect(subject.calculate([2, 2, 2, 5])).to eq(250)
    end

    it 'calculates the score with a full roll of 5 dice' do
      expect(subject.calculate([1, 1, 1, 1, 1])).to eq(1200)
      expect(subject.calculate([5, 5, 5, 5, 1])).to eq(650)
      expect(subject.calculate([6, 6, 6, 2, 1])).to eq(700)
      expect(subject.calculate([5, 1, 3, 4, 1])).to eq(250)
      expect(subject.calculate([1, 1, 1, 3, 1])).to eq(1100)
      expect(subject.calculate([2, 4, 4, 5, 4])).to eq(450)
    end
  end

  describe '.triple?' do
    it 'returns true when a triple is rolled' do
      roll = [1, 1, 1, 4, 5]
      expect(subject.triple?(roll)).to eq(true)
    end
  end
end