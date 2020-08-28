# frozen_string_literal: true

require "robot_application/command_factory/robot_command"

module RobotApplication
  class CommandFactory
    class TurnRightRobotCommand < RobotCommand
      def execute(robot:, table:)
        robot.update_position(direction: (robot.direction + 1) % 4) unless robot.idle?
      end
    end
  end
end
