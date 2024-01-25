# frozen_string_literal: true

require "robot_application/command/base"
require "robot_application/facing_direction"

module RobotApplication
  module Command
    class Place < Base
      def execute(robot:, table:)
        if table.contains_coordinates?(x: x, y: y) && FacingDirection.valid?(direction)
          robot.update_position(
            x: x,
            y: y,
            direction: FacingDirection[direction],
          )
        else
          $stderr.puts "Invalid coordinates or facing direction given for #{type} command"
        end
      end

      private

      def x
        Integer(arguments[0])
      rescue StandardError
        -1
      end

      def y
        Integer(arguments[1])
      rescue StandardError
        -1
      end

      def direction
        @direction ||= arguments[2].strip
      end
    end
  end
end
