# frozen_string_literal: true

module RobotApplication
  class TurningStrategy
    class RightAngle
      FULL_CIRCLE_DEGREES = 360
      SHIFT_DEGREES = 90
      
      attr_reader :starting_direction

      def initialize(starting_direction:)
        @starting_direction = starting_direction
      end

      def clockwise(times: 1)
        return unless (starting_direction % SHIFT_DEGREES) == 0
        (starting_direction + times * SHIFT_DEGREES) % FULL_CIRCLE_DEGREES
      end

      def anticlockwise(times: 1)
        return unless (starting_direction % SHIFT_DEGREES) == 0
        (starting_direction - times * SHIFT_DEGREES) % FULL_CIRCLE_DEGREES
      end
    end
  end
end
