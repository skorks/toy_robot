module RobotApplication
  class Table
    class << self
      def build(width:, height:, obstacle_coordinates:)
        table = new(width: width, height: height)

        obstacle_coordinates.each do |x, y|
          table.place_obstacle(x: x, y: y)
        end
        table
      end
    end

    attr_reader :width, :height, :obstacle_coordinates

    def initialize(width:, height:)
      @width = width
      @height = height
      @obstacle_coordinates = {}
    end

    def contains_coordinates?(x:, y:)
      x >= 0 &&
      x < width &&
      y >= 0 &&
      y < height
    end

    def has_obstacle_at?(x:, y:)
      obstacle_coordinates["#{x}_#{y}"]
    end

    def coordinates_empty?(x:, y:)
      contains_coordinates?(x: x, y: y) && !has_obstacle_at?(x: x, y: y)
    end

    def place_obstacle(x:, y:)
      if coordinates_empty?(x: x, y: y)
        obstacle_coordinates["#{x}_#{y}"] = [x, y]
      end
    end
  end
end
