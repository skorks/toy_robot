# frozen_string_literal: true

require "robot_application/utils/integer"
require "robot_application/robot_command/base"
require "robot_application/facing_direction"

module RobotApplication
  module RobotCommand
    class Place < Base
      def execute(robot:, table:)
        if table.contains_position?(position: position) && direction
          robot.update!(position: position, direction: direction)
        else
          $stderr.puts "Invalid coordinates or facing direction given for #{type} command"
        end
      end

      private

      def position
        @position = Table::Position.new(
          x: Utils::Integer.parse(value: arguments[0], default: -1), 
          y: Utils::Integer.parse(value: arguments[1], default: -1),
        )
      end

      def direction
        @direction ||= compass.angle_for(name: arguments[2].strip)
      end
    end
  end
end
