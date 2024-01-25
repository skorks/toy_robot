# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class TurnRight < Base
      def execute(robot:, table:)
        robot.update_position(direction: (robot.direction + 1) % 4) unless robot.idle?
      end
    end
  end
end
