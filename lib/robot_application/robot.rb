module RobotApplication
  class Robot
    attr_reader :x, :y, :direction

    def initialize
      @x = nil
      @y = nil
      @direction = nil
      @table = nil
    end

    def update_position(x: nil, y: nil, direction: nil, table: nil)
      @x = x || @x
      @y = y || @y
      @direction = direction || @direction
      @table = table || @table
    end

    def idle?
      @table.nil?
    end
  end
end
