# frozen_string_literal: true

require_relative 'player'

class Robot < Player

  attr_reader :difficulty
  attr_accessor :board_copy

  def initialize(name, marker, difficulty)
    super(name, marker)
    @difficulty = difficulty
  end

  def next_move(board, next_player_marker)
    send("move_for_#{difficulty.downcase}", board, next_player_marker)
  end

  private

  def move_for_easy(board, _next_player = nil)
    BoardEvaluator.available_spaces(board.array).sample
  end

  def move_for_hard(board, next_player_marker)
    if board.array[4] != @marker && board.array[4] != next_player_marker
      4
    else
      @board_copy = board
      get_best_move(next_player_marker)
    end
  end

  def get_best_move(next_player_marker)
    available_spaces = BoardEvaluator.available_spaces(@board_copy.array)
    available_spaces.each do |spot|
      best_move = spot_to_end_game(spot, @marker)
      best_move = spot_to_end_game(spot, next_player_marker) if best_move.nil?

      return best_move unless best_move.nil?

      @board_copy.array[spot.to_i] = spot
    end

    move_for_easy(@board_copy)
  end

  def spot_to_end_game(spot, marker)
    @board_copy.array[spot.to_i] = marker
    spot.to_i if BoardEvaluator.game_is_over?(@board_copy.array)
  end
end
