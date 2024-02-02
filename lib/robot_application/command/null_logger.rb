# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class NullLogger < Base
      def execute(dependency_container:)
        $stderr.puts "Invalid command given #{@type.upcase}"
      end
    end
  end
end
