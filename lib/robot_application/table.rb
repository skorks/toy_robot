# frozen_string_literal: true

require "robot_application/utils/integer"

module RobotApplication
  class Table
    attr_reader :width, :height

    def initialize(width:, height:)
      @width = Utils::Integer.parse(value: width, default: 0)
      @height = Utils::Integer.parse(value: height, default: 0)
    end

    def contains_cell?(cell:)
      (0...width).cover?(cell.x) && (0...height).cover?(cell.y)
    end

    class Cell 
      attr_reader :x, :y

      def initialize(x:, y:)
        @x = x
        @y = y
      end

      def clone
        self.class.new(x: x, y: y)
      end

      def to_s
        "#{x},#{y}"
      end
    end

    class Position 
      attr_reader :cell, :direction

      def initialize(cell:, direction:)
        @cell = cell
        @direction = direction
      end

      def clone
        self.class.new(
          cell: cell.clone,
          direction: direction.clone,
        )
      end

      def increment_cell(x: 0, y: 0)
        @cell = Table::Cell.new(x: cell.x + x, y: cell.y + y)
        self
      end

      def to_s
        "#{cell.to_s},#{FacingDirection.name_for(direction)}"
      end
    end
  end
end
