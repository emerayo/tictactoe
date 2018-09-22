# frozen_string_literal: true

require_relative '../spec_helper'

describe Board, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }
  let(:human) { Human.new('Player 1', 'X') }

  context '#mark_in_table' do
    it 'should mark a space in the board' do
      board.mark_in_table(0, human.marker)
      expect(board.array[0]).to be_eql human.marker
    end
  end

  describe '#print_board' do
    it 'should draw board' do
      msg = " 0 | 1 | 2\n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | 8\n"
      expect { board.print_board }.to output(msg).to_stdout
    end
  end

  describe '#print_available_spaces' do
    it 'should output print_available_spaces message' do
      expect { board.print_available_spaces }.to output("Type one of these available spaces: 0, 1, 2, 3, 4, 5, 6, 7, 8\n").to_stdout
    end
  end

end
