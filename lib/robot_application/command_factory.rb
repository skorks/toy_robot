# frozen_string_literal: true

require "robot_application/robot_command/place"
require "robot_application/robot_command/move"
require "robot_application/robot_command/left"
require "robot_application/robot_command/right"
require "robot_application/robot_command/report"
require "robot_application/robot_command/null"

module RobotApplication
  class CommandFactory
    COMMAND_MAPPING = {
      place: ::RobotApplication::RobotCommand::Place,
      move: ::RobotApplication::RobotCommand::Move,
      left: ::RobotApplication::RobotCommand::Left,
      right: ::RobotApplication::RobotCommand::Right,
      report: ::RobotApplication::RobotCommand::Report,
    }.freeze

    def build(type:, arguments: [])
      command_type_symbol = type.downcase.to_sym
      command_class = COMMAND_MAPPING[command_type_symbol] ||
                      ::RobotApplication::RobotCommand::Null.new(type: type, arguments: arguments)
      command_class.new(type: command_type_symbol, arguments: arguments)
    end
  end
end
