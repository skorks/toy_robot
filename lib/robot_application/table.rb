# frozen_string_literal: true

require "robot_application/utils/integer"

module RobotApplication
  class Table
    attr_reader :width, :height

    def initialize(width:, height:)
      @width = Utils::Integer.parse(value: width, default: 0)
      @height = Utils::Integer.parse(value: height, default: 0)
    end

    # def contains_coordinates?(x:, y:)
    #   (0...width).cover?(x) && (0...height).cover?(y)
    # end

    def contains_cell?(cell:)
      (0...width).cover?(cell.x) && (0...height).cover?(cell.y)
    end

    class Cell 
      attr_reader :x, :y

      def initialize(x:, y:)
        @x = x
        @y = y
      end

      # def ==(another_cell)
      #   another_cell.class == self.class && another_cell.to_h == to_h
      # end
      # alias_method :eql?, :==

      # def to_h
      #   { x: x, y: y }
      # end

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

      def to_s
        "#{cell.to_s},#{FacingDirection.name_for(direction)}"
      end

      # def to_h
      #   {
      #     direction: direction,
      #   }.merge(cell.to_h)
      # end
    end
  end
end
