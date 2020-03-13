# frozen_string_literal: true

require "robot_application/utils/integer"

module RobotApplication
  class Table
    DEFAULT_WIDTH = 5
    DEFAULT_HEIGHT = 5

    attr_reader :width, :height

    def initialize(width:, height:)
      @width = Utils::Integer.parse(value: width, default: 0)
      @height = Utils::Integer.parse(value: height, default: 0)
    end

    def contains_position?(position:)
      (0...width).cover?(position.x) && (0...height).cover?(position.y)
    end

    class Position
      attr_reader :x, :y

      def initialize(x:, y:)
        @x = x
        @y = y
      end

      def increment(x: 0, y: 0)
        self.class.new(x: self.x + x, y: self.y + y)
      end

      def clone
        increment(x: 0, y: 0)
      end

      def to_s
        "#{x},#{y}"
      end
    end
  end
end
