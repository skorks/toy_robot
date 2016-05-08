require "robot_application/command_factory/place_robot_command"
require "robot_application/command_factory/move_robot_command"
require "robot_application/command_factory/turn_left_robot_command"
require "robot_application/command_factory/turn_right_robot_command"
require "robot_application/command_factory/report_robot_command"
require "robot_application/command_factory/null_robot_command"

module RobotApplication
  class CommandFactory
    # make sure we keep the keys as strings by using the hashrocket syntax
    COMMAND_MAPPING = {
      "PLACE" => PlaceRobotCommand,
      "MOVE" => MoveRobotCommand,
      "LEFT" => TurnLeftRobotCommand,
      "RIGHT" => TurnRightRobotCommand,
      "REPORT" => ReportRobotCommand,
    }

    def build(type:, arguments: [])
      command_class = COMMAND_MAPPING[type]

      if command_class
        command_class.new(type: type, arguments: arguments)
      else
        # we can invert this dependency if we want to test it, etc.
        $stderr.puts "Invalid command given #{type}"
        NullRobotCommand.new(type: type, arguments: arguments)
      end
    end
  end
end
