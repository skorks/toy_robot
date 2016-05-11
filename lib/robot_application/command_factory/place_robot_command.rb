require "robot_application/command_factory/robot_command"
require "robot_application/facing_direction"

module RobotApplication
  class CommandFactory
    class PlaceRobotCommand < RobotCommand
      def execute(robot:, table:)
        if arguments_valid_for?(table)
          table.robot = robot
          robot.set_position(x: x_coordinate, y: y_coordinate, facing: FacingDirection.value_for(facing_direction))
        else
          $stderr.puts "Invalid coordinates or facing direction given for #{type} command"
        end
      end

      private

      def arguments_valid_for?(table)
        coordinates_valid_for?(table) && FacingDirection.valid?(facing_direction)
      end

      def coordinates_valid_for?(table)
        x_coordinate >= 0 &&
        x_coordinate < table.width &&
        y_coordinate >= 0 &&
        y_coordinate < table.height
      end

      def x_coordinate
        Integer(arguments[0])
      rescue
        -1
      end

      def y_coordinate
        Integer(arguments[1])
      rescue
        -1
      end

      def facing_direction
        @facing_direction ||= arguments[2]
      end
    end
  end
end
