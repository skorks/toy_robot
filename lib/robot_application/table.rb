# frozen_string_literal: true

module RobotApplication
  class Table
    DEFAULT_WIDTH = 5
    DEFAULT_HEIGHT = 5

    attr_reader :width, :height

    def initialize(width:, height:)
      @width = width
      @height = height
    end

    def valid_position?(x:, y:)
      contains_coordinates?(x:, y:)
    end

    def contains_coordinates?(x:, y:)
      x.between?(0, width - 1) && y.between?(0, height - 1)
    end
  end
end
