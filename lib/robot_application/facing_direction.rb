# frozen_string_literal: true

# class Compass
#   NAMED_DIRECTIONS = { "NORTH" => 0, "EAST" => 90, "SOUTH" => 180, "WEST" => 270 }

#   def value_for(direction)
#     NAMED_DIRECTIONS[direction.upcase.to_s]
#   end
#   alias [] value_for

#   def valid?(direction)
#     !!value_for(direction)
#   end

#   def name_for(direction_value)
#     value = NAMED_DIRECTIONS.invert[direction_value]
#     value ? value.to_s.upcase : nil
#   end
# end


module RobotApplication
  module FacingDirection
    DIRECTIONS = {
      north: 0,
      east: 1,
      south: 2,
      west: 3,
    }.freeze

    class << self
      def value_for(direction)
        DIRECTIONS[direction.downcase.to_sym]
      end
      alias [] value_for

      def valid?(direction)
        !!value_for(direction)
      end

      def name_for(direction_value)
        value = inverted_directions[direction_value]
        value ? value.to_s.upcase : nil
      end

      private

      def inverted_directions
        @inverted_directions ||= DIRECTIONS.invert
      end
    end
  end
end
