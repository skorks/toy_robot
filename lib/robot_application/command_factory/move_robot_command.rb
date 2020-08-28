# frozen_string_literal: true

require "robot_application/command_factory/robot_command"
require "robot_application/command_factory/moves/north_move"
require "robot_application/command_factory/moves/east_move"
require "robot_application/command_factory/moves/south_move"
require "robot_application/command_factory/moves/west_move"

module RobotApplication
  class CommandFactory
    class MoveRobotCommand < RobotCommand
      def execute(robot:, table:)
        return if robot.idle?

        # using naming convention here to find and instantiate relavant
        # classes that implement direction moves, could use a lookup table
        # similar to what we do in CommandFactory, if we want complete
        # control of class names
        class_prefix = FacingDirection.name_for(robot.direction).downcase.capitalize
        class_name = RobotApplication::CommandFactory::Moves.const_get("#{class_prefix}Move")
        class_name.new(robot: robot, table: table).execute
      end
    end
  end
end
