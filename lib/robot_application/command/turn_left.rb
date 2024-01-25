# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class TurnLeft < Base
      def execute(robot:, table:)
        robot.update_direction(direction: (robot.direction - 1) % 4) unless robot.idle?
      end
    end
  end
end
