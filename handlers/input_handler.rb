# frozen_string_literal: true

require_relative '../helpers/print_helper'

class InputHandler

  class << self

    def get_input_for_array(available_options)
      loop = true

      while loop
        input = treat_input
        if available_options.include? input
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

    def treat_input
      input = gets.chomp.gsub(/[^\d]/, '')
      input == '' ? input : input.to_i
    end

  end
end
