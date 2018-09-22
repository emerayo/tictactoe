# frozen_string_literal: true

require_relative '../spec_helper'

describe Human, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }

  context '#next_move' do
    it 'should output print_available_spaces message' do
      allow(InputHandler).to receive(:gets).and_return('1')

      human = Human.new('Player 1', 'X')

      expect(human.next_move(board)).to be_eql 1
    end
  end

end
