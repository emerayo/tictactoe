# frozen_string_literal: true

require_relative '../spec_helper'

describe Robot, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }
  let(:robot) { Robot.new('Player 1', Marker::M1, RobotDifficulty::HARD) }
  let(:robot_easy) { Robot.new('Player 2', Marker::M2, RobotDifficulty::EASY) }

  context '#next_move' do
    it 'should return the new spot in the board' do
      expect(robot.next_move(board, Marker::M2)).to be_eql 4
    end

    it 'should return the new spot in the board' do
      board.array[4] = 'O'

      expect(robot.next_move(board, Marker::M2)).to_not be_eql 4
    end

    it 'should return the new spot in the board' do
      board.array[4] = 'O'

      expect(robot_easy.next_move(board, Marker::M1)).to_not be_eql 4
    end

    it 'should return 0 to finish the game' do
      board.array[1] = 'O'
      board.array[2] = 'O'
      board.array[4] = 'X'

      expect(robot.next_move(board, Marker::M2)).to be_eql 0
    end

    it 'should return 5 to finish the game' do
      board.array[3] = 'O'
      board.array[4] = 'O'

      expect(robot.next_move(board, Marker::M2)).to be_eql 5
    end

    it 'should return 8 to finish the game' do
      board.array[6] = 'O'
      board.array[7] = 'O'
      board.array[4] = 'X'

      expect(robot.next_move(board, Marker::M2)).to be_eql 8
    end

  end

end
