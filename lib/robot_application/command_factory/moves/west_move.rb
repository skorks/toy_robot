require "robot_application/command_factory/moves/directed_move"

module RobotApplication
  class CommandFactory
    class Moves
      class WestMove < DirectedMove
        def execute
          new_x = robot.x - 1
          if table.coordinates_empty?(x: new_x, y: robot.y)
            robot.update_position(x: new_x)
          end
        end
      end
    end
  end
end
