# frozen_string_literal: true

require_relative '../spec_helper'

describe RobotDifficulty, type: :model do

  describe 'TYPES' do

    it 'should be an array' do
      expect(described_class::TYPES).to be_an Array
    end

    it 'should be an array with two values' do
      expect(described_class::TYPES).to be_eql (['Easy', 'Hard'])
    end
  end

end
