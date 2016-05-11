require "robot_application/command_factory/moves/directed_move"

module RobotApplication
  class CommandFactory
    class Moves
      class NorthMove < DirectedMove
        def permitted?
          robot.y < table.height - 1
        end

        def execute
          robot.set_position(x: robot.x, y: robot.y + 1, facing: robot.facing)
        end
      end
    end
  end
end
