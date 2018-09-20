class PrintHelper

  class << self

    def print_options(types, klass_name)
      puts "These are the available #{klass_name}s:"
      types.each_with_index do |type, index|
        puts "Type #{index} for #{types[index]}"
      end
    end

    def print_available_spaces(available_spaces)
      puts "Type one of these available spaces: #{available_spaces}"
    end

    def new_player(player_type, marker)
      puts "New #{player_type} chosen! With this marker: #{marker}"
    end

    def turn(player_name)
      puts "It's #{player_name}'s turn:"
    end

    def winner(player_name)
      puts "Congratulations! You won, #{player_name}!"
    end

    def tied_game
      puts 'Oh no! Nobody won, tied game!'
    end

    def wrong_option
      puts 'Wrong option! Please, type again:'
    end

    def print_board(array)
      puts " #{array[0]} | #{array[1]} | #{array[2]}"
      puts '===+===+==='
      puts " #{array[3]} | #{array[4]} | #{array[5]}"
      puts '===+===+==='
      puts " #{array[6]} | #{array[7]} | #{array[8]}"
    end

  end
end
