# encoding: utf-8

require_relative '../../initializer'

describe Game, type: :model do

  let(:board) { Board.new(Marker::M1, Marker::M2) }
  let(:human) { Human.new('Player 1', 'X') }
  let(:game) { Game.new }

  # describe '#play' do
  #   it 'should draw board' do
  #     msg = " 0 | 1 | 2\n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | 8\n"
  #
  #     expect { system(msg) }.to output.to_stderr_from_any_process
  #     expect { system("It's Player 1's turn:") }.to output.to_stderr_from_any_process
  #     expect { system("It's Player 2's turn:") }.to output.to_stderr_from_any_process
  #   end
  #
  #   it 'should print a winner' do
  #     # allow(PlayerInitializer).to receive(:player1).and_return()
  #     # allow(PlayerInitializer).to receive(:player2).and_return()
  #
  #     expect { system('Congratulations! You won, Player 1!\n') }.to output.to_stderr_from_any_process
  #     expect { system('Congratulatias3as3ons! You won, Player 1!\n') }.to output.to_stderr_from_any_process
  #   end
  #
  #   it 'should print a tied game' do
  #     # allow(PlayerInitializer).to receive(:player1).and_return()
  #     # allow(PlayerInitializer).to receive(:player2).and_return()
  #
  #     expect { system('Oh no! Nobody won, tied game!\n') }.to output.to_stderr_from_any_process
  #   end
  # end

end
