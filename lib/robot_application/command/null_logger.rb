# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class NullLogger < Base
      def execute(robot:, table:)
        $stderr.puts "Invalid command given #{type.upcase}"
      end
    end
  end
end
