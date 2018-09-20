class GameSetup

  attr_accessor :player1, :player2, :second_marker

  def initialize_players
    @used_marker = []
    @player1 = choose_player_type(PLAYER + ' 1')
    @player2 = choose_player_type(PLAYER + ' 2')
  end

  private

  PLAYER = 'Player'.freeze

  def choose_player_type(name)
    PrintHelper.print_options(PlayerType::TYPES, 'PlayerType')

    player_type = InputHandler.get_input_for_array(ArrayHelper.array_indexes(PlayerType::TYPES))
    marker = choose_marker

    PrintHelper.new_player(PlayerType::TYPES[player_type], marker)

    new_player(player_type, name, marker)
  end

  def new_player(type, name, marker)
    if PlayerType::TYPES[type] == PlayerType::HUMAN
      Human.new(name, marker)
    else
      Robot.new(name, marker)
    end
  end

  def choose_marker
    if @second_marker.nil?
      PrintHelper.print_options(Marker::MARKERS, 'Marker')
      marker = InputHandler.get_input_for_array(ArrayHelper.array_indexes(Marker::MARKERS))
      marker = Marker::MARKERS[marker]

      assign_second_marker(marker)
      marker
    else
      @second_marker
    end
  end

  def assign_second_marker(marker)
    left_option_arr = Marker::MARKERS - [marker]
    @second_marker = left_option_arr.first
  end
end
