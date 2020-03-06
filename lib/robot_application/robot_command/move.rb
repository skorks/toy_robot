# frozen_string_literal: true

module RobotApplication
  class RobotCommand
    class Move < Base 
      def preconditions_met?
        robot.ready?
      end

      def execute_when_preconditions_met
        if table.covers_position?(position: robot.position.increment(**robot.vector.components))
          robot.increment_position(**robot.vector.components)
        end
      end
    end
  end
end
