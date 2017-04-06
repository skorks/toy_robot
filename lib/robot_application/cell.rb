module RobotApplication
  class Cell
    attr_reader :x, :y

    def initialize(x:, y:)
      @x = x
      @y = y
    end

    def direction_relative_to(robot:)
      destination_direction = nil
      if y < robot.y
        destination_direction = FacingDirection::DIRECTIONS[:south]
      elsif y > robot.y
        destination_direction = FacingDirection::DIRECTIONS[:north]
      elsif x < robot.x
        destination_direction = FacingDirection::DIRECTIONS[:west]
      elsif x > robot.x
        destination_direction = FacingDirection::DIRECTIONS[:east]
      else
        destination_direction = robot.direction
      end
      destination_direction
    end
  end
end
