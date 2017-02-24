require "robot_application/command_factory/robot_command"

module RobotApplication
  class CommandFactory
    class TurnLeftRobotCommand < RobotCommand
      def execute(robot:, table:)
        unless robot.idle?
          robot.update_position(direction: (robot.direction - 1)%4)
        end
      end
    end
  end
end
