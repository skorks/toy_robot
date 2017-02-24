require "robot_application/command_factory/robot_command"

module RobotApplication
  class CommandFactory
    class ReportRobotCommand < RobotCommand
      def execute(robot:, table:)
        unless robot.idle?
          $stdout.puts "#{robot.x},#{robot.y},#{FacingDirection.name_for(robot.direction)}"
        end
      end
    end
  end
end
