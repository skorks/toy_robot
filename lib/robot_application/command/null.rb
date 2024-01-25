# frozen_string_literal: true

require "robot_application/command/base"

module RobotApplication
  module Command
    class Null < Base
      def execute(robot:, table:); end
    end
  end
end
