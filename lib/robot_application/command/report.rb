# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class Report < Base
      def execute(robot:, table:)
        return if robot.idle?
        $stdout.puts "#{robot.x},#{robot.y},#{FacingDirection.name_for(robot.direction)}"
      end
    end
  end
end
