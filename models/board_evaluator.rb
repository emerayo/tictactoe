class BoardEvaluator

  class << self

    def available_spaces(array)
      ArrayHelper.available_spaces(array, Marker::M1, Marker::M2)
    end

    def game_is_over?(board)
      [board[0], board[1], board[2]].uniq.length == 1 ||
        [board[3], board[4], board[5]].uniq.length == 1 ||
        [board[6], board[7], board[8]].uniq.length == 1 ||
        [board[0], board[3], board[6]].uniq.length == 1 ||
        [board[1], board[4], board[7]].uniq.length == 1 ||
        [board[2], board[5], board[8]].uniq.length == 1 ||
        [board[0], board[4], board[8]].uniq.length == 1 ||
        [board[2], board[4], board[6]].uniq.length == 1
    end

    def game_is_tied?(board)
      board.all? { |elem| [Marker::M1, Marker::M2].include?(elem) }
    end

  end
end