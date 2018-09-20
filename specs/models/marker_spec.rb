# encoding: utf-8

require_relative '../../models/marker'

describe Marker, type: :model do

  describe 'MARKERS' do

    it 'should be an array' do
      expect(described_class::MARKERS).to be_an Array
    end

    it 'should be an array with two values' do
      expect(described_class::MARKERS).to be_eql (['O', 'X'])
    end
  end

end
