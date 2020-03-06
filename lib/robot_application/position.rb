module RobotApplication
  class Position
    attr_reader :x, :y

    def initialize(x:, y:)
      @x = x
      @y = y
    end

    def increment(x: 0, y: 0)
      self.class.new(x: @x + x, y: @y + y)
    end

    def clone
      self.class.new(x: @x, y: @y)
    end

    def to_s
      "#{@x},#{@y}"
    end
  end
end
