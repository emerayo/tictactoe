# frozen_string_literal: true

class GameSetup

  attr_accessor :player1, :player2, :second_marker

  def initialize_players
    @used_marker = []
    @player1 = choose_player_type(PLAYER + ' 1')
    @player2 = choose_player_type(PLAYER + ' 2')
  end

  private

  PLAYER = 'Player'

  def choose_player_type(name)
    player_type = handle_input(PlayerType::TYPES, PlayerType.to_s)
    marker = choose_marker

    new_player(player_type, name, marker)
  end

  def handle_input(array, klass_name)
    PrintHelper.print_options(array, klass_name)

    InputHandler.get_input_for_array(
      ArrayHelper.array_indexes(array)
    )
  end

  def choose_marker
    if @second_marker.nil?
      marker = Marker::MARKERS[handle_input(Marker::MARKERS, Marker.to_s)]

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

  def new_player(type, name, marker)
    if PlayerType::TYPES[type] == PlayerType::HUMAN
      PrintHelper.new_player(PlayerType::TYPES[type], marker)
      Human.new(name, marker)
    else
      difficulty = choose_robot_difficulty
      PrintHelper.new_player(PlayerType::TYPES[type], marker, difficulty)
      Robot.new(name, marker, difficulty)
    end
  end

  def choose_robot_difficulty
    index = handle_input(RobotDifficulty::TYPES, RobotDifficulty.to_s)
    RobotDifficulty::TYPES[index]
  end
end
