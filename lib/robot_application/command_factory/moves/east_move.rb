# frozen_string_literal: true

require "robot_application/command_factory/moves/directed_move"

module RobotApplication
  class CommandFactory
    class Moves
      class EastMove < DirectedMove
        def execute
          new_x = robot.x + 1
          robot.update_position(x: new_x) if table.contains_coordinates?(x: new_x, y: robot.y)
        end
      end
    end
  end
end
