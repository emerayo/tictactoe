# frozen_string_literal: true

require_relative '../spec_helper'

describe BoardEvaluator, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }
  let(:human) { Human.new('Player 1', 'X') }

  context '#available_spaces' do
    it 'should print full original board array' do
      expect(described_class.available_spaces(board.array)).to be_eql [0, 1, 2, 3, 4, 5, 6, 7, 8]
    end

    it 'should print board array without marked spot' do
      board.mark_in_table(0, human.marker)
      expect(described_class.available_spaces(board.array)).to be_eql [1, 2, 3, 4, 5, 6, 7, 8]
    end
  end

  context '#game_is_over?' do
    it 'should return true' do
      expect(described_class.game_is_over?(board.array)).to be_falsey
    end

    it 'should return true' do
      board.array[0] = [Marker::M1]
      board.array[1] = [Marker::M1]
      board.array[2] = [Marker::M1]

      expect(described_class.game_is_over?(board.array)).to be_truthy
    end
  end

  context '#game_is_tied?' do
    it 'should return false' do
      expect(described_class.game_is_tied?(board.array)).to be_falsey
    end

    it 'should return true' do
      board.array = [Marker::M1]
      expect(described_class.game_is_tied?(board.array)).to be_truthy
    end
  end

end
