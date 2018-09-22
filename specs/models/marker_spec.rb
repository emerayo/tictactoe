# frozen_string_literal: true

require_relative '../spec_helper'

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
