require "robot_application/command_factory/robot_command"
require "robot_application/facing_direction"

module RobotApplication
  class CommandFactory
    class PlaceRobotCommand < RobotCommand
      def execute(robot:, table:)
        if table.contains_coordinates?(x: x, y: y) && FacingDirection.valid?(direction)
          robot.update_position(
            x: x,
            y: y,
            direction: FacingDirection[direction],
            table: table,
          )
        else
          $stderr.puts "Invalid coordinates or facing direction given for #{type} command"
        end
      end

      private

      def x
        Integer(arguments[0])
      rescue
        -1
      end

      def y
        Integer(arguments[1])
      rescue
        -1
      end

      def direction
        @direction ||= arguments[2].strip
      end
    end
  end
end
