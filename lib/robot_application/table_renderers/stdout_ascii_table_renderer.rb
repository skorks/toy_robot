module RobotApplication
  class TableRenderers
    class StdoutAsciiTableRenderer
      def render(table:, robot:)
        p table
        draw_table(table: table, x: robot.x, y: robot.y, direction: robot.direction)
        draw_idling_robot if robot.idle?
      end

      private

      def draw_table(table:, x: -1, y: -1, direction: FacingDirection[:north])
        (table.height-1).downto(0) do |row|
          draw_row_separator(table.width)
          0.upto(table.width-1) do |column|
            draw_column_separator
            if column == x && row == y
              draw_robot_cell(direction: direction)
            elsif table.has_obstacle_at?(x: column, y: row)
              draw_obstacle_cell
            else
              draw_empty_cell
            end
          end
          draw_column_separator(newline: true)
        end
        draw_row_separator(table.width)
      end

      def draw_row_separator(width)
        puts "-" * (width+1+(width*3))
      end

      def draw_column_separator(newline: false)
        print "|"
        puts if newline
      end

      def draw_empty_cell
        print "   "
      end

      def draw_obstacle_cell
        print " * "
      end

      def draw_robot_cell(direction: 0)
        robot_char_mapping = {
          FacingDirection[:north] => "^",
          FacingDirection[:east] => ">",
          FacingDirection[:south] => "v",
          FacingDirection[:west] => "<",
        }
        print " #{robot_char_mapping[direction]} "
      end

      def draw_idling_robot
        puts "__o__"
      end
    end
  end
end
