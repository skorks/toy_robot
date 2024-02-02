# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class TurnLeft < Base
      prepend Base::EnsureRobotPlaced

      def execute(dependency_container:)
        robot = dependency_container.robot
        robot.update_direction(direction: (robot.direction - 90) % 360)
      end
    end
  end
end
