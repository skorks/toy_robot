require "robot_application/command_factory/moves/directed_move"

module RobotApplication
  class CommandFactory
    class Moves
      class WestMove < DirectedMove
        def permitted?
          robot.x > 0
        end

        def execute
          robot.set_position(x: robot.x - 1, y: robot.y)
        end
      end
    end
  end
end
