# frozen_string_literal: true

require_relative '../spec_helper'

describe Game, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }
  let(:robot1) { Robot.new('Player 1', 'X', RobotDifficulty::HARD) }
  let(:robot2) { Robot.new('Player 2', 'O', RobotDifficulty::HARD) }
  let(:game) { Game.new }

  before(:each) do
    allow(InputHandler).to receive(:gets).and_return('1')
    allow(GameSetup).to receive(:player1).and_return(robot1)
    allow(GameSetup).to receive(:player2).and_return(robot2)
  end

  RSpec.shared_examples 'console output with message' do |msg|
    it 'should output message at some point in execution' do
      expectation = expect { game.play }
      expectation.to output(msg).to_stdout
    end
  end

  describe '#play' do
    context 'print each player turn' do
      it_behaves_like 'console output with message', /It's Player 1's turn:/
      it_behaves_like 'console output with message', /It's Player 2's turn:/
    end

    context 'print the board' do
      it_behaves_like 'console output with message', /0 | 1 | 2/
      it_behaves_like 'console output with message', /3 | 4 | 5/
      it_behaves_like 'console output with message', /6 | 7 | 8/
    end

    context 'setup the game correctly' do
      it_behaves_like 'console output with message', /These are the available PlayerTypes:/
      it_behaves_like 'console output with message', /Type 0 for Human/
      it_behaves_like 'console output with message', /Type 1 for Robot/
      it_behaves_like 'console output with message', /These are the available Markers:/
      it_behaves_like 'console output with message', /Type 0 for O/
      it_behaves_like 'console output with message', /Type 1 for X/
      it_behaves_like 'console output with message', /These are the available RobotDifficultys:/
      it_behaves_like 'console output with message', /Type 0 for O/
      it_behaves_like 'console output with message', /Type 1 for X/
      it_behaves_like 'console output with message', /New Robot chosen! With marker O and difficulty Hard/
      it_behaves_like 'console output with message', /New Robot chosen! With marker X and difficulty Hard/
    end

    context 'player 1 wins the game' do
      before(:each) do
        allow(BoardEvaluator).to receive(:game_is_over?).and_return(true)
        game.last_player = robot1
      end

      it_behaves_like 'console output with message', /Congratulations! You won, Player 1!/
    end

    context 'player 2 wins the game' do
      before(:each) do
        allow(BoardEvaluator).to receive(:game_is_over?).and_return(true)
        game.last_player = robot2
      end

      it_behaves_like 'console output with message', /Congratulations! You won, Player 2!/
    end

    context 'game finish tied' do
      before(:each) do
        allow(BoardEvaluator).to receive(:game_is_tied?).and_return(true)
      end

      it_behaves_like 'console output with message', /Oh no! Nobody won, tied game!/
    end
  end

end
