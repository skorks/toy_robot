# frozen_string_literal: true

require "robot_application/command_factory/robot_command"

module RobotApplication
  class CommandFactory
    class NullRobotCommand < RobotCommand
      def execute(robot:, table:); end
    end
  end
end
