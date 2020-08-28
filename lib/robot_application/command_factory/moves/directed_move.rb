# frozen_string_literal: true

module RobotApplication
  class CommandFactory
    class Moves
      class DirectedMove
        attr_reader :robot, :table

        def initialize(robot:, table:)
          @robot = robot
          @table = table
        end

        def execute
          raise Error, "Base class #{self.class.name} should not be used directly"
        end
      end
    end
  end
end
