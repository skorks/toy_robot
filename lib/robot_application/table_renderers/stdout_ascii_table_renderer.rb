module RobotApplication
  class TableRenderers
    class StdoutAsciiTableRenderer
      def render(table:, robot:)
        draw_table(width: table.width, height: table.height, x: robot.x, y: robot.y, facing: robot.facing)
        unless table.containsRobot?
          draw_idling_robot
        end
      end

      private

      def draw_table(width:, height:, x: -1, y: -1, facing: FacingDirection::NORTH)
        (height-1).downto(0) do |row|
          draw_row_separator(width)
          0.upto(width-1) do |column|
            draw_column_separator
            if column == x && row == y
              draw_robot_cell(facing: facing)
            else
              draw_empty_cell
            end
          end
          draw_column_separator(newline: true)
        end
        draw_row_separator(width)
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

      def draw_robot_cell(facing: 0)
        robot_char_mapping = {
          FacingDirection::NORTH => "^",
          FacingDirection::EAST => ">",
          FacingDirection::SOUTH => "v",
          FacingDirection::WEST => "<",
        }
        print " #{robot_char_mapping[facing]} "
      end

      def draw_idling_robot
        puts "__o__"
      end
    end
  end
end
