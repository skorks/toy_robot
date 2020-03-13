# frozen_string_literal: true

module RobotApplication
  module TableRenderer
    class StdoutAscii
      def render(table:, robot:)
        draw_table(
          width: table.width,
          height: table.height,
          x: robot.position.x,
          y: robot.position.y,
          direction: robot.direction,
        )
        draw_idling_robot if robot.idle?
      end

      private

      def draw_table(width:, height:, x: -1, y: -1, direction: NamedDirection::Container::Default::ALL[:north])
        (height - 1).downto(0) do |row|
          draw_row_separator(width)
          0.upto(width - 1) do |column|
            draw_column_separator
            if column == x && row == y
              draw_robot_cell(direction: direction)
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

      def draw_robot_cell(direction: 0)
        robot_char_mapping = {
          NamedDirection::Container::Default::ALL[:north] => "^",
          NamedDirection::Container::Default::ALL[:east] => ">",
          NamedDirection::Container::Default::ALL[:south] => "v",
          NamedDirection::Container::Default::ALL[:west] => "<",
        }
        print " #{robot_char_mapping[direction]} "
      end

      def draw_idling_robot
        puts "__o__"
      end
    end
  end
end
