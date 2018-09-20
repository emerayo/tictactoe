require_relative 'player'

class Human < Player

  def next_move(board, _next_player_marker = nil)
    board.print_available_spaces
    InputHandler.get_input_for_array(BoardEvaluator.available_spaces(board.array))
  end

end
