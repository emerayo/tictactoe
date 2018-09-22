# frozen_string_literal: true

class ArrayHelper

  class << self

    def array_indexes(array)
      array.map { |x| array.index { |d| d == x } }
    end

    def available_spaces(array, marker1, marker2)
      array.select { |z| z != marker1 && z != marker2 }
           .map { |x| array.index { |d| d == x } }
    end

  end
end