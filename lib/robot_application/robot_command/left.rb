# frozen_string_literal: true

require "robot_application/robot_command/base"

module RobotApplication
  module RobotCommand
    class Left < Base
      def execute(robot:, table:)
        return if robot.idle?

        robot.update!(direction: turning_strategy.new(starting_direction: robot.direction).anticlockwise)
      end
    end
  end
end
