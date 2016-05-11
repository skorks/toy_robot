require "robot_application/command_factory/robot_command"
require "robot_application/command_factory/moves/north_move"
require "robot_application/command_factory/moves/east_move"
require "robot_application/command_factory/moves/south_move"
require "robot_application/command_factory/moves/west_move"

module RobotApplication
  class CommandFactory
    class MoveRobotCommand < RobotCommand
      MOVE_MAPPING = {
        FacingDirection::NORTH => Moves::NorthMove,
        FacingDirection::SOUTH => Moves::SouthMove,
        FacingDirection::EAST => Moves::EastMove,
        FacingDirection::WEST => Moves::WestMove,
      }

      def execute(robot:, table:)
        if table.containsRobot?
          move = MOVE_MAPPING[robot.facing].new(robot: robot, table: table)
          move.execute if move.permitted?
        end
      end
    end
  end
end
