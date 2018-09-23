# frozen_string_literal: true

require_relative 'player'

class Robot < Player

  attr_reader :difficulty

  def initialize(name, marker, difficulty)
    super(name, marker)
    @difficulty = difficulty
  end

  def next_move(board, next_player_marker)
    send("move_for_#{difficulty.downcase}", board, next_player_marker)
  end

  private

  def move_for_easy(board, _next_player)
    BoardEvaluator.available_spaces(board.array).sample
  end

  def move_for_hard(board, next_player_marker)
    spot = nil
    until spot
      if board.array[4] != @marker && board.array[4] != next_player_marker
        spot = 4
        board.array[spot] = @marker
      else
        spot = get_best_move(board, next_player_marker)
        if board.array[spot] != @marker && board.array[spot] != next_player_marker
          spot
        else
          spot = nil
        end
      end
    end

    spot
  end

  def get_best_move(board, next_player_marker)
    available_spaces_arr = BoardEvaluator.available_spaces(board.array)
    best_move = nil
    available_spaces_arr.each do |as|
      board.array[as.to_i] = @marker
      if BoardEvaluator.game_is_over?(board.array)
        best_move = as.to_i
        board.array[as.to_i] = as
        return best_move
      else
        board.array[as.to_i] = next_player_marker
        if BoardEvaluator.game_is_over?(board.array)
          best_move = as.to_i
          board.array[as.to_i] = as
          return best_move
        else
          board.array[as.to_i] = as
        end
      end
    end
    if best_move
      best_move
    else
      n = rand(0..available_spaces_arr.count)
      available_spaces_arr[n].to_i
    end
  end
end
