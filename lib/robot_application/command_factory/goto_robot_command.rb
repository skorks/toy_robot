require "robot_application/command_factory/robot_command"
require "robot_application/facing_direction"

module RobotApplication
  class CommandFactory
    class GotoRobotCommand < RobotCommand
      class RobotController
        attr_reader :robot, :table

        def initialize(robot:, table:)
          @robot = robot
          @table = table
        end

        def turn(desired_facing:)
          turn_count = (robot.direction - desired_facing).abs
          return if turn_count == 0
          opposite_turn_count = FacingDirection::DIRECTIONS.keys.count - turn_count
          turn_direction = (robot.direction - desired_facing)/turn_count
          opposite_turn_direction = -1 * turn_direction
          turn = [[turn_count, turn_direction], [opposite_turn_count, opposite_turn_direction]].min_by { |v| v[0] }
          turn[0].times do
            if turn[1] < 0
              TurnRightRobotCommand.new(type: :turn_right).execute(robot: robot, table: table)
              p "RIGHT"
            else
              TurnLeftRobotCommand.new(type: :turn_left).execute(robot: robot, table: table)
              p "LEFT"
            end
          end
        end

        def move
          MoveRobotCommand.new(type: :move).execute(robot: robot, table: table)
          p "MOVE"
        end
      end

      class PathFinder
        attr_reader :robot, :table

        def initialize(robot:, table:)
          @robot = robot
          @table = table
        end

        def find_path_to(x:, y:)
          best_path = nil
          paths = []
          current_path = [-1, [Cell.new(x: robot.x, y: robot.y)]]

          loop do
            break if current_path == nil
            if current_path[0] == 0
              best_path = current_path[1]
              break
            end

            neighbour_cells = table.neighbours_of(x: current_path[1].last.x, y: current_path[1].last.y)

            neighbour_cells.each do |cell|
              distance_to_destination = (x - cell.x).abs + (y - cell.y).abs
              path = current_path[1].reduce([]) { |acc, c| acc << c; acc }
              path << cell
              paths << [distance_to_destination, path]
            end
            paths = paths.sort_by{ |v| v[0] }
            current_path = paths.delete_at(0)
          end
          best_path
        end
      end

      def execute(robot:, table:)
        if !robot.idle? && table.coordinates_empty?(x: x, y: y)
          best_path = PathFinder.new(robot: robot, table: table).find_path_to(x: x, y: y)
          if best_path
            best_path.each_with_index do |cell, index|
              next if index == 0 # the original location of the robot
              controller = RobotController.new(robot: robot, table: table)
              controller.turn(desired_facing: cell.direction_relative_to(robot: robot))
              controller.move
            end
          else
            $stderr.puts "No path to found to x: #{x}, y: #{y}"
          end
        end
      end

      private

      def x
        Integer(arguments[0])
      rescue
        -1
      end

      def y
        Integer(arguments[1])
      rescue
        -1
      end
    end
  end
end
