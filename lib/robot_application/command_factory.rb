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
      place: RobotCommand::Place,
      move: RobotCommand::Move,
      left: RobotCommand::Left,
      right: RobotCommand::Right,
      report: RobotCommand::Report,
    }.freeze

    attr_reader :turning_strategy, :named_directions

    def initialize(turning_strategy:, named_directions:)
      @turning_strategy = turning_strategy
      @named_directions = named_directions
    end

    def build(type:, arguments: [])
      command_type_symbol = type.downcase.to_sym
      command_class = COMMAND_MAPPING[command_type_symbol] || RobotCommand::Null
      command_class.new(
        type: command_type_symbol,
        arguments: arguments,
        named_directions: named_directions,
        turning_strategy: turning_strategy,
      )
    end
  end
end
