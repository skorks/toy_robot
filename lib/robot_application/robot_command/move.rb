# frozen_string_literal: true

require "robot_application/robot_command/base"
require "robot_application/robot_command/directed_move/north"
require "robot_application/robot_command/directed_move/east"
require "robot_application/robot_command/directed_move/south"
require "robot_application/robot_command/directed_move/west"

module RobotApplication
  module RobotCommand
    class Move < Base
      def execute(robot:, table:)
        return if robot.idle?
        # using naming convention here to find and instantiate relavant
        # classes that implement direction moves, could use a lookup table
        # similar to what we do in CommandFactory, if we want complete
        # control of class names
        class_prefix = compass.name_for(angle: robot.direction).downcase.capitalize
        class_name = RobotApplication::RobotCommand::DirectedMove::const_get(class_prefix.to_s)
        class_name.new(robot: robot, table: table).execute
      end
    end
  end
end
