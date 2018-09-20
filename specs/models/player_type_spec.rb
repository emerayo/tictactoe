# encoding: utf-8

require_relative '../../models/player_type'

describe PlayerType, type: :model do

  describe 'TYPES' do

    it 'should be an array' do
      expect(described_class::TYPES).to be_an Array
    end

    it 'should be an array with two values' do
      expect(described_class::TYPES).to be_eql (['Human', 'Robot'])
    end
  end

end
