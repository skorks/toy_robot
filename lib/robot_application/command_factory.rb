# frozen_string_literal: true

require "robot_application/command/place"
require "robot_application/command/move"
require "robot_application/command/turn_left"
require "robot_application/command/turn_right"
require "robot_application/command/report"
require "robot_application/command/null"

module RobotApplication
  class CommandFactory
    COMMAND_MAPPING = {
      place: RobotApplication::Command::Place,
      move: RobotApplication::Command::Move,
      left: RobotApplication::Command::TurnLeft,
      right: RobotApplication::Command::TurnRight,
      report: RobotApplication::Command::Report,
    }.freeze

    def build(type:, arguments: [])
      command_type_symbol = type.downcase.to_sym
      command_class = COMMAND_MAPPING[command_type_symbol]

      if command_class
        command_class.new(type: command_type_symbol, arguments: arguments)
      else
        # we can invert this dependency if we want to test it, etc.
        $stderr.puts "Invalid command given #{type.to_s.upcase}"
        RobotApplication::Command::Null.new(type: type, arguments: arguments)
      end
    end
  end
end

        # class_prefix = FacingDirection.name_for(robot.direction).downcase.capitalize
        # class_name = RobotApplication::CommandFactory::Moves.const_get("#{class_prefix}Move")
        # class_name.new(robot: robot, table: table).execute
