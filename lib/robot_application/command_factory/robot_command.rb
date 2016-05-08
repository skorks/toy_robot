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
        raise Error.new("Base command #{self.class.name} should not be used directly")
      end
    end
  end
end
