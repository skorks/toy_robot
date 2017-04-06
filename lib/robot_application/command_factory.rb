require "robot_application/command_factory/place_robot_command"
require "robot_application/command_factory/move_robot_command"
require "robot_application/command_factory/turn_left_robot_command"
require "robot_application/command_factory/turn_right_robot_command"
require "robot_application/command_factory/report_robot_command"
require "robot_application/command_factory/null_robot_command"
require "robot_application/command_factory/goto_robot_command"

module RobotApplication
  class CommandFactory
    COMMAND_MAPPING = {
      place: PlaceRobotCommand,
      move: MoveRobotCommand,
      left: TurnLeftRobotCommand,
      right: TurnRightRobotCommand,
      report: ReportRobotCommand,
      goto: GotoRobotCommand,
    }

    def build(type:, arguments: [])
      command_type_symbol = type.downcase.to_sym
      command_class = COMMAND_MAPPING[command_type_symbol]

      if command_class
        command_class.new(type: command_type_symbol, arguments: arguments)
      else
        # we can invert this dependency if we want to test it, etc.
        $stderr.puts "Invalid command given #{type.to_s.upcase}"
        NullRobotCommand.new(type: type, arguments: arguments)
      end
    end
  end
end
