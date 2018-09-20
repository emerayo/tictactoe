class Board

  attr_accessor :array, :p1, :p2

  def initialize(p1, p2)
    @array = %w[0 1 2 3 4 5 6 7 8]
    @p1 = p1
    @p2 = p2
  end

  def mark_in_table(spot, marker)
    array[spot] = marker
  end

  def print_board
    PrintHelper.print_board(array)
  end

  def print_available_spaces
    PrintHelper.print_available_spaces(BoardEvaluator.available_spaces(array).join(', '))
  end

end
