# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class TurnRight < Base
      def execute(dependency_container:)
        robot = dependency_container.robot
        return if robot.idle?
        robot.update_direction(direction: (robot.direction + 90) % 360)
      end
    end
  end
end
