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
          return unless table.contains_coordinates?(**new_coordinates)
          robot.update_position(**new_coordinates)
        end

        def new_coordinates
          { x: robot.x, y: robot.y }
        end
      end
    end
  end
end
