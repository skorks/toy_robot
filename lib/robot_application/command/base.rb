# frozen_string_literal: true

require "robot_application/error"

module RobotApplication
  module Command
    class Base
      attr_reader :type, :arguments

      def initialize(type:, arguments: [])
        @type = type
        @arguments = arguments
      end

      def execute(dependency_container:)
        raise Error, "Base class #{self.class.name} should not be used directly"
      end
    end
  end
end
