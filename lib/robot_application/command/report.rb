# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class Report < Base
      def execute(robot:, table:)
        $stdout.puts "#{robot.x},#{robot.y},#{FacingDirection.name_for(robot.direction)}" unless robot.idle?
      end
    end
  end
end
