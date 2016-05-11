module RobotApplication
  module FacingDirection
    NORTH = 0
    EAST = 1
    SOUTH = 2
    WEST = 3

    class << self
      def valid?(direction_string)
        !!direction_mapping[direction_string]
      end

      def value_for(direction_string)
        direction_mapping[direction_string]
      end

      private

      def direction_mapping
        @direction_mapping ||= {
          "NORTH" => NORTH,
          "EAST" => EAST,
          "SOUTH" => SOUTH,
          "WEST" => WEST,
        }
      end
    end
  end
end
