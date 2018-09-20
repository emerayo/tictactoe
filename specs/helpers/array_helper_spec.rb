# encoding: utf-8

require_relative '../../helpers/array_helper'

describe ArrayHelper, type: :model do

  describe '#array_indexes' do
    it 'should return an array of indexes for the given array' do
      expect(described_class.array_indexes(['Human', 'Robot'])).to be_eql [0, 1]
    end

    it 'should return only an index for the first value in object' do
      expect(described_class.array_indexes(['Human', 'Robot', 'Robot', 'Human'])).to be_eql [0, 1, 1, 0]
    end
  end

end
