# frozen_string_literal: true

require_relative '../helpers/print_helper'

class InputHandler

  class << self

    def get_input_for_array(available_options)
      loop = true

      while loop
        input = treat_input
        loop = invalid_input?(available_options, input)
      end

      input.to_i
    end

    def treat_input
      input = gets.chomp.gsub(/[^\d]/, '')
      input == '' ? input : input.to_i
    end

    def invalid_input?(available_options, input)
      return if available_options.include? input

      PrintHelper.wrong_option
      true
    end

  end
end
