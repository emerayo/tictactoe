# frozen_string_literal: true

require_relative '../spec_helper'

describe Robot, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }
  let(:robot) { Robot.new('Player 1', 'X', RobotDifficulty::HARD) }

  context '#next_move' do
    it 'should return the new spot in the board' do
      allow(InputHandler).to receive(:gets).and_return('1')

      expect(robot.next_move(board, 'O')).to be_eql 4
    end

    it 'should return the new spot in the board' do
      allow(InputHandler).to receive(:gets).and_return('1')
      board.array[4] = 'O'

      expect(robot.next_move(board, 'O')).to_not be_eql 4
    end
  end

end
