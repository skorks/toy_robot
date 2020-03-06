# frozen_string_literal: true

require "robot_application/robot_command/base"

module RobotApplication
  module RobotCommand
    class Report < Base
      def execute(robot:, table:)
        return if robot.idle?
        $stdout.puts "#{robot.x},#{robot.y},#{FacingDirection.name_for(robot.direction)}"
      end
    end
  end
end
