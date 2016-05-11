require "robot_application/command_factory/robot_command"

module RobotApplication
  class CommandFactory
    class TurnRightRobotCommand < RobotCommand
      def execute(robot:, table:)
        if table.containsRobot?
          robot.set_facing((robot.facing + 1)%4)
        end
      end
    end
  end
end
