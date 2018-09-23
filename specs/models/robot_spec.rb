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
  end

end
