# frozen_string_literal: true

require "robot_application/robot_command/base"

module RobotApplication
  module RobotCommand
    class Report < Base
      def execute(robot:, table:)
        return if robot.idle?

        $stdout.puts robot.position.to_s
      end
    end
  end
end
