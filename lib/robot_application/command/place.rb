# frozen_string_literal: true

require "robot_application/command/base"
require "robot_application/facing_direction"

module RobotApplication
  module Command
    class Place < Base
      def execute(robot:, table:)
        if table.valid_position?(x: x, y: y) && FacingDirection.valid?(direction)
          robot.update_position(x: x, y: y)
          robot.update_direction(direction: FacingDirection[direction])
        else
          $stderr.puts "Invalid coordinates or facing direction given for #{type} command"
        end
      end

      private

      def x
        @x ||= Utils::Integer.parse(value: arguments[0], default: -1)
      end

      def y
        @y ||= Utils::Integer.parse(value: arguments[1], default: -1)
      end

      def direction
        @direction ||= arguments[2].strip
      end
    end
  end
end
