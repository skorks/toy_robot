# frozen_string_literal: true

require "robot_application/robot_command/base"

module RobotApplication
  module RobotCommand
    class Null < Base
      def execute(robot:, table:)
        # we can invert this dependency if we want to test it, etc.
        warn "Invalid command given #{type.to_s.upcase}"
      end
    end
  end
end
