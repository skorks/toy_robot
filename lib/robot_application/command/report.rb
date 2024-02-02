# frozen_string_literal: true

require "robot_application/command/base"
require "robot_application/compass"

module RobotApplication
  module Command
    class Report < Base
      prepend Base::EnsureRobotPlaced

      def execute(dependency_container:)
        robot, compass = dependency_container.fetch(:robot, :compass)
        $stdout.puts "#{robot.x},#{robot.y},#{compass.name_for(robot.direction)}"
      end
    end
  end
end
