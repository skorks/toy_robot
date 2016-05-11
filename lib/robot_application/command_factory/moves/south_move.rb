require "robot_application/command_factory/moves/directed_move"

module RobotApplication
  class CommandFactory
    class Moves
      class SouthMove < DirectedMove
        def permitted?
          robot.y > 0
        end

        def execute
          robot.set_position(x: robot.x, y: robot.y - 1)
        end
      end
    end
  end
end
