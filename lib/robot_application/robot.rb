module RobotApplication
  class Robot
    attr_reader :x, :y, :facing

    def initialize
      @x = nil
      @y = nil
      @facing = nil
    end

    def set_position(x:, y:, facing: FacingDirection::NORTH)
      @x = x
      @y = y
      @facing = facing
      self
    end

    # no named arguments, must be called with argument
    def set_facing(facing)
      @facing = facing
      self
    end
  end
end
