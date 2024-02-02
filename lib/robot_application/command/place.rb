# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class Place < Base
      def execute(dependency_container:)
        robot, table, compass = dependency_container.fetch(:robot, :table, :compass)

        if table.valid_position?(x: x, y: y) && compass.valid?(direction)
          robot.update_position(x: x, y: y)
          robot.update_direction(direction: compass[direction])
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
