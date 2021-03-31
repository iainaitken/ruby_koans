require 'scoring'

RSpec.describe Scoring do
  describe '.calculate' do
    subject { described_class }

    it 'calculates a zero score' do
      expect(subject.calculate([4])).to eq(0)
    end
  end
end