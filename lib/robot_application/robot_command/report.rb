# frozen_string_literal: true

require "robot_application/robot_command/base"

module RobotApplication
  module RobotCommand
    class Report < Base
      def execute(robot:, table:)
        return if robot.idle?

        $stdout.puts "#{robot.position},#{compass.name_for(angle: robot.direction)}"
      end
    end
  end
end
