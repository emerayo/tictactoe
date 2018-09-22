# frozen_string_literal: true

require_relative '../spec_helper'

describe InputHandler, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }

  context '#get_input_for_array(available_options)' do
    it 'should output print_available_spaces message' do
      allow(described_class).to receive(:treat_input).and_return('1')
      expect(described_class.get_input_for_array(board.array)).to be_eql 1
    end

    it 'should output print_available_spaces message' do
      allow(described_class).to receive(:treat_input).and_return('1')
      expect(described_class.get_input_for_array(board.array)).to be_eql 1
    end
  end

  describe '#wrong_option' do
    it 'should output turn message' do
      allow(described_class).to receive(:treat_input).and_return('2')

      expect(described_class.get_input_for_array(board.array)).to be_eql 2
    end
  end

  describe '#treat_input' do
    it 'should return a integer when given an integer' do
      allow(described_class).to receive(:gets).and_return('3')

      expect(described_class.treat_input).to be_eql 3
    end

    it 'should return a blank string when given a string' do
      allow(described_class).to receive(:gets).and_return('string')

      expect(described_class.treat_input).to be_eql ''
    end
  end

end
