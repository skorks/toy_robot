require "robot_application/command_factory/robot_command"

module RobotApplication
  class CommandFactory
    class ReportRobotCommand < RobotCommand
      def execute(robot:, table:)
        if table.containsRobot?
          $stdout.puts "#{robot.x},#{robot.y},#{FacingDirection.name_for(robot.facing)}"
        end
      end
    end
  end
end
