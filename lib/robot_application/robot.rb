# frozen_string_literal: true

module RobotApplication
  class Robot
    attr_reader :x, :y, :direction

    def initialize
      @x, @y, @direction = nil, nil, nil
    end

    def update_position(x:, y:)
      @x, @y = x, y
    end

    def update_direction(direction:)
      @direction = direction
    end

    def idle?
      @x.nil? || @y.nil? || @direction.nil?
    end
  end
end
