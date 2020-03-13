# frozen_string_literal: true

module RobotApplication
  module RobotCommand
    module DirectedMove
      class Base
        attr_reader :robot, :table

        def initialize(robot:, table:)
          @robot = robot
          @table = table
        end

        def execute
          return unless table.contains_position?(position: new_position)

          robot.update!(position: new_position)
        end

        def new_position
          @new_position = robot.position.clone
        end
      end
    end
  end
end
