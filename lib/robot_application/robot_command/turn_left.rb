# frozen_string_literal: true

require "robot_application/command_factory/robot_command"

module RobotApplication
  class RobotCommand
    class TurnLeft < Base
      def preconditions_met?
        robot.ready?
      end

      def execute_when_preconditions_met
        # robot.shift_vector(degrees: RobotApplication::Vector::NAMED_COMPONENT_SHIFT_DEGREES)
        # Robot::VectorChangeStrategy.new(vector: robot.vector).next
        robot.vector_change_strategy.next
      end
    end
  end
end
