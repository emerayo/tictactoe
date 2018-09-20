# encoding: utf-8

require_relative '../../initializer'

describe InputHandler, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }

  context '#get_input_for_array(available_options)' do
    it 'should output print_available_spaces message' do
      allow(described_class).to receive(:gets).and_return('1')
      expect(described_class.get_input_for_array(board.array)).to be_eql 1
    end
  end

  describe '#wrong_option' do
    it 'should output turn message' do
      allow(described_class).to receive(:gets).and_return('9')
      allow(described_class).to receive(:gets).and_return('2')

      expect(described_class.get_input_for_array(board.array)).to be_eql 2
    end
  end

end
