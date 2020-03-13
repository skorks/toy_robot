# frozen_string_literal: true

module RobotApplication
  class Robot
    attr_reader :position, :direction

    def initialize
      @position = nil
      @direction = nil
    end

    def update!(position: nil, direction: nil)
      @position = position || @position
      @direction = direction || @direction
      self
    end

    def idle?
      position.nil? || direction.nil?
    end
  end
end
