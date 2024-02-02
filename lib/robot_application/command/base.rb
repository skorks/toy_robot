# frozen_string_literal: true

require "robot_application/error"

module RobotApplication
  module Command
    class Base
      module EnsureRobotPlaced
        def execute(dependency_container:)
          return if dependency_container.robot.idle?
          super
        end
      end

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
