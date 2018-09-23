# frozen_string_literal: true

require_relative '../spec_helper'

describe InputHandler, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }

  context '#get_input_for_array(available_options)' do
    before(:each) do
      allow(described_class).to receive(:treat_input).and_return('1')
    end

    let(:returned_value) { described_class.get_input_for_array(board.array) }

    it 'should return correct input as number' do
      expect(returned_value).to eql 1
    end

    it 'should return input as integer message' do
      expect(returned_value.is_a?(Integer)).to be_truthy
    end
  end

  describe '#treat_input' do
    it 'should return a integer when given an integer' do
      allow(described_class).to receive(:gets).and_return('3')

      expect(described_class.treat_input).to eql 3
    end

    it 'should return a blank string when given a string' do
      allow(described_class).to receive(:gets).and_return('string')

      expect(described_class.treat_input).to be_eql ''
    end
  end

  describe '#valid_input?' do
    let(:available_options) { [0, 1] }
    let(:input) { 1 }
    let(:wrong_input) { 3 }
    let(:msg) { "Wrong option! Please, type again:\n" }

    it 'should return true when invalid input' do
      expect(described_class.invalid_input?(available_options, wrong_input)).to be_truthy
    end

    it 'should output a wrong option message message when invalid input' do
      expect { described_class.invalid_input?(available_options, wrong_input) }.to output(msg).to_stdout
    end

    it 'should return false when valid input' do
      expect(described_class.invalid_input?(available_options, input)).to be_falsey
    end

    it 'should not output a wrong option message message when valid input' do
      expect { described_class.invalid_input?(available_options, input) }.to_not output(msg).to_stdout
    end
  end

end
