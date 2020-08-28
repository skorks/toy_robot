# frozen_string_literal: true

require "robot_application/error"

module RobotApplication
  class CommandFactory
    class RobotCommand
      attr_reader :type, :arguments

      def initialize(type:, arguments: [])
        @type = type
        @arguments = arguments
      end

      def execute(robot:, table:)
        raise Error, "Base class #{self.class.name} should not be used directly"
      end
    end
  end
end
