require_relative '../tictactoe'

class Game

  attr_accessor :last_player

  def initialize
    @board = ::Board.new(Marker::M1, Marker::M2)
  end

  def play
    setup_game
    round until finished_game?
    finish_game
  end

  private

  def finish_game
    if BoardEvaluator.game_is_over?(@board.array)
      PrintHelper.winner(last_player.name)
    else
      PrintHelper.tied_game
    end
  end

  def finished_game?
    BoardEvaluator.game_is_over?(@board.array) || BoardEvaluator.game_is_tied?(@board.array)
  end

  def setup_game
    setup = GameSetup.new
    setup.initialize_players

    @player1 = setup.player1
    @player2 = setup.player2
  end

  def first_run
    @board.print_board
  end

  def round
    @board.print_board
    PrintHelper.turn(@player1.name)
    get_player_move(@player1, @player2)
    @board.print_board

    return if finished_game?
    PrintHelper.turn(@player2.name)
    get_player_move(@player2, @player1)
  end

  def get_player_move(player, next_player)
    spot = player.next_move(@board, next_player.marker)
    @board.mark_in_table(spot, player.marker)
    @last_player = player
  end

end
