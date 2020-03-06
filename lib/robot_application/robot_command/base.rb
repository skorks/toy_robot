# frozen_string_literal: true

require "robot_application/error"

module RobotApplication
  class RobotCommand
    class Base 
      attr_reader :robot, :table, :output_writer, :raw_arguments, :arguments

      def initialize(robot:, table:, raw_arguments:, output_writer: nil)
        @robot = robot
        @table = table 
        @output_writer = output_writer
        @raw_arguments = raw_arguments
        @arguments = raw_arguments
      end

      def preconditions_met?
        true
      end

      def execute_when_preconditions_met
      end

      def execute_when_preconditions_fail
      end

      def execute(raw_arguments: nil)
        if preconditions_met?
          execute_when_preconditions_met
        else
          execute_when_preconditions_fail
        end
      end
    end
  end
end
