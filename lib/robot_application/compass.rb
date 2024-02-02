# frozen_string_literal: true

module RobotApplication
  class Compass
    DEFAULT_VALID_DIRECTIONS = { "NORTH" => 0, "EAST" => 90, "SOUTH" => 180, "WEST" => 270 }

    def initialize(valid_directions: DEFAULT_VALID_DIRECTIONS)
      @valid_directions = valid_directions
    end

    def value_for(direction)
      @valid_directions[direction.upcase.to_s]
    end
    alias [] value_for

    def valid?(direction)
      !!value_for(direction)
    end

    def name_for(direction_value)
      value = @valid_directions.invert[direction_value]
      value ? value.to_s.upcase : nil
    end
  end
end
