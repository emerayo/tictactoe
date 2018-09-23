# frozen_string_literal: true

require_relative '../spec_helper'

describe PrintHelper, type: :model do

  describe '#print_options' do
    it 'should output print_available_spaces message' do
      msg = "These are the available Players:\nType 0 for Human\nType 1 for Robot\n"
      expect { described_class.print_options(['Human', 'Robot'], 'Player') }.to output(msg).to_stdout
    end
  end

  describe '#print_available_spaces' do
    it 'should output print_available_spaces message' do
      msg = "Type one of these available spaces: 0, 1\n"
      expect { described_class.print_available_spaces('0, 1') }.to output(msg).to_stdout
    end
  end

  describe '#new_player' do
    it 'should output new_player message without difficulty when human' do
      msg = "New Human chosen! With marker X\n"
      expect { described_class.new_player(PlayerType::HUMAN, 'X') }.to output(msg).to_stdout
    end

    it 'should output new_player message with difficulty when robot' do
      msg = "New Robot chosen! With marker X and difficulty Easy\n"
      expect { described_class.new_player(PlayerType::ROBOT, 'X', RobotDifficulty::EASY) }.to output(msg).to_stdout
    end
  end

  describe '#winner' do
    it 'should output winner message' do
      msg = "Congratulations! You won, Player 1!\n"
      expect { described_class.winner('Player 1') }.to output(msg).to_stdout
    end
  end

  describe '#turn' do
    it 'should output turn message' do
      msg = "It's Player 1's turn:\n"
      expect { described_class.turn('Player 1') }.to output(msg).to_stdout
    end
  end

  describe '#tied_game' do
    it 'should output turn message' do
      msg = "Oh no! Nobody won, tied game!\n"
      expect { described_class.tied_game }.to output(msg).to_stdout
    end
  end

  describe '#wrong_option' do
    it 'should output turn message' do
      msg = "Wrong option! Please, type again:\n"
      expect { described_class.wrong_option }.to output(msg).to_stdout
    end
  end

  describe '#print_board' do
    it 'should draw board' do
      msg = " 0 | 1 | 2\n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | 8\n"
      expect { described_class.print_board(%w[0 1 2 3 4 5 6 7 8]) }.to output(msg).to_stdout
    end
  end

end
