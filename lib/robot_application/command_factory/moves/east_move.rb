require "robot_application/command_factory/moves/directed_move"

module RobotApplication
  class CommandFactory
    class Moves
      class EastMove < DirectedMove
        def permitted?
          robot.x < table.width - 1
        end

        def execute
          robot.set_position(x: robot.x + 1, y: robot.y, facing: robot.facing)
        end
      end
    end
  end
end
