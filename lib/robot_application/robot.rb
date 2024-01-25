# frozen_string_literal: true

module RobotApplication
  class Robot
    attr_reader :x, :y, :direction

    def initialize
      @x = nil
      @y = nil
      @direction = nil
    end

    def update_position(x: nil, y: nil, direction: nil)
      @x = x || @x
      @y = y || @y
      @direction = direction || @direction
    end

    def idle?
      @table.nil?
    end
  end
end
