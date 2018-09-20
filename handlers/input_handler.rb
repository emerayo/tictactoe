require_relative '../helpers/print_helper'

class InputHandler

  class << self

    def get_input_for_array(available_options)
      loop = true

      while loop
        input = gets.chomp.gsub(/[^\d]/, '')
        if available_options.join(', ').include? input
          loop = false
        else
          PrintHelper.wrong_option
        end
      end

      input.to_i
    end

    def get_element_in_array_from_input(array, available_options)
      array[get_input_for_array(available_options)]
    end

  end
end
