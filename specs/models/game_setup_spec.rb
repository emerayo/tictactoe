# frozen_string_literal: true

require_relative '../spec_helper'

describe GameSetup, type: :model do

  let(:game_setup) { GameSetup.new }

  context '#initialize_players' do
    it 'should output print_available_spaces message' do
      allow(InputHandler).to receive(:gets).and_return('1')

      game_setup.initialize_players

      expect(game_setup.player1.is_a? (Robot)).to be_truthy
      expect(game_setup.player2.is_a? (Robot)).to be_truthy
      expect(game_setup.player1.marker).to be_eql 'X'
      expect(game_setup.player2.marker).to be_eql 'O'
      expect(game_setup.player1.difficulty).to be_eql 'Hard'
      expect(game_setup.player2.difficulty).to be_eql 'Hard'
    end

    it 'should output print_available_spaces message' do
      allow(InputHandler).to receive(:gets).and_return('0')

      game_setup.initialize_players

      expect(game_setup.player1.is_a? (Human)).to be_truthy
      expect(game_setup.player2.is_a? (Human)).to be_truthy
      expect(game_setup.player1.marker).to be_eql 'O'
      expect(game_setup.player2.marker).to be_eql 'X'
    end
  end

end
