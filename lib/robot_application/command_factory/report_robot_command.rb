# frozen_string_literal: true

require "robot_application/command_factory/robot_command"

module RobotApplication
  class CommandFactory
    class ReportRobotCommand < RobotCommand
      def execute(robot:, table:)
        $stdout.puts "#{robot.x},#{robot.y},#{FacingDirection.name_for(robot.direction)}" unless robot.idle?
      end
    end
  end
end
