# frozen_string_literal: true

module RobotApplication
  module TableRenderer
    class StdoutAscii
      def render(dependency_container:)
        render_tool = RenderTool.new(dependency_container:)
        render_tool.draw_table
        render_tool.idling_robot
      end

      class RenderTool
        def initialize(dependency_container:)
          @dependency_container = dependency_container
          @robot, @table, @compass = dependency_container.fetch(:robot, :table, :compass)
        end

        def row_separator
          puts "-" * (@table.width + 1 + (@table.width * 3))
        end

        def column_separator(newline: false)
          print "|"
          puts if newline
        end

        def empty_cell
          print "   "
        end

        def robot_cell
          robot_char_mapping = {
            @compass[:north] => "^",
            @compass[:east] => ">",
            @compass[:south] => "v",
            @compass[:west] => "<",
          }
          print " #{robot_char_mapping[@robot.direction]} "
        end

        # Draws the table with the robot's position highlighted.
        def draw_table
          (@table.height - 1).downto(0) do |row|
            row_separator
            0.upto(@table.width - 1) do |column|
              column_separator
              column == @robot.x && row == @robot.y ? robot_cell : empty_cell
            end
            column_separator(newline: true)
          end
          row_separator
        end

        def idling_robot
          puts "__o__" if @robot.idle?
        end
      end
    end
  end
end
