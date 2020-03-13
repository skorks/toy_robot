# frozen_string_literal: true

require "robot_application/error"
require "robot_application/compass"

module RobotApplication
  module RobotCommand
    class Base
      attr_reader :type, :arguments, :named_directions, :turning_strategy

      def initialize(type:, arguments: [], named_directions:, turning_strategy:)
        @named_directions = named_directions
        @turning_strategy = turning_strategy
        @type = type
        @arguments = arguments
      end

      def execute(robot:, table:)
        raise Error, "Base class #{self.class.name} should not be used directly"
      end

      private

      def compass
        @compass ||= Compass.new(named_directions: named_directions)
      end
    end
  end
end
