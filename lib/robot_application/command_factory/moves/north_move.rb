# frozen_string_literal: true

require "robot_application/command_factory/moves/directed_move"

module RobotApplication
  class CommandFactory
    class Moves
      class NorthMove < DirectedMove
        def execute
          new_y = robot.y + 1
          robot.update_position(y: new_y) if table.contains_coordinates?(x: robot.x, y: new_y)
        end
      end
    end
  end
end
