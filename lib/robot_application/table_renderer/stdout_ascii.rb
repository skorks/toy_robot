# frozen_string_literal: true

module RobotApplication
  module TableRenderer
    class StdoutAscii
      def render(dependency_container:)
        robot = dependency_container.robot
        draw_table(
          compass: dependency_container.compass,
          width: dependency_container.table_width,
          height: dependency_container.table_height,
          x: robot.x,
          y: robot.y,
          direction: robot.direction,
        )
        draw_idling_robot if robot.idle?
      end

      private

      def draw_table(compass:, width:, height:, x: -1, y: -1, direction:)
        (height - 1).downto(0) do |row|
          draw_row_separator(width)
          0.upto(width - 1) do |column|
            draw_column_separator
            if column == x && row == y
              draw_robot_cell(compass:, direction:)
            else
              draw_empty_cell
            end
          end
          draw_column_separator(newline: true)
        end
        draw_row_separator(width)
      end

      def draw_row_separator(width)
        puts "-" * (width + 1 + (width * 3))
      end

      def draw_column_separator(newline: false)
        print "|"
        puts if newline
      end

      def draw_empty_cell
        print "   "
      end

      def draw_robot_cell(compass:, direction:)
        robot_char_mapping = {
          compass[:north] => "^",
          compass[:east] => ">",
          compass[:south] => "v",
          compass[:west] => "<",
        }
        print " #{robot_char_mapping[direction]} "
      end

      def draw_idling_robot
        puts "__o__"
      end
    end
  end
end
