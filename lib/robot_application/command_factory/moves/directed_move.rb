module RobotApplication
  class CommandFactory
    class Moves
      class DirectedMove
        attr_reader :robot, :table

        def initialize(robot:, table:)
          @robot = robot
          @table = table
        end

        def permitted?
          raise Error.new("Base class #{self.class.name} should not be used directly")
        end

        def execute
          raise Error.new("Base class #{self.class.name} should not be used directly")
        end
      end
    end
  end
end