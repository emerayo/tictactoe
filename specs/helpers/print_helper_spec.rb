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
      expect { described_class.print_available_spaces('0, 1') }.to output("Type one of these available spaces: 0, 1\n").to_stdout
    end
  end

  describe '#new_player' do
    it 'should output new_player message' do
      expect { described_class.new_player('Player 1', 'X') }.to output("New Player 1 chosen! With this marker: X\n").to_stdout
    end
  end

  describe '#winner' do
    it 'should output winner message' do
      expect { described_class.winner('Player 1') }.to output("Congratulations! You won, Player 1!\n").to_stdout
    end
  end

  describe '#turn' do
    it 'should output turn message' do
      expect { described_class.turn('Player 1') }.to output("It's Player 1's turn:\n").to_stdout
    end
  end

  describe '#tied_game' do
    it 'should output turn message' do
      expect { described_class.tied_game }.to output("Oh no! Nobody won, tied game!\n").to_stdout
    end
  end

  describe '#wrong_option' do
    it 'should output turn message' do
      expect { described_class.wrong_option }.to output("Wrong option! Please, type again:\n").to_stdout
    end
  end

  describe '#print_board' do
    it 'should draw board' do
      msg = " 0 | 1 | 2\n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | 8\n"
      expect { described_class.print_board(%w[0 1 2 3 4 5 6 7 8]) }.to output(msg).to_stdout
    end
  end

end
