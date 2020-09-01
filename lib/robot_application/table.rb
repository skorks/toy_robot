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

    def contains_coordinates?(x:, y:)
      x >= 0 &&
        x < width &&
        y >= 0 &&
        y < height
    end
  end
end
