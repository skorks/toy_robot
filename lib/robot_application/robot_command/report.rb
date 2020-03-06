# frozen_string_literal: true

require "robot_application/command_factory/robot_command"

module RobotApplication
  class RobotCommand
    class Report < Base
      def preconditions_met?
        robot.ready?
      end

      def execute_when_preconditions_met
        output_writer.message robot.to_s
      end
    end
  end
end
