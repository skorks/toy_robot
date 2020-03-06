module RobotApplication
  class Table < Struct(:width, :height)
    def covers_position?(position:)
      position.x >= 0 &&
      position.x < width &&
      position.y >= 0 &&
      position.y < height
    end
  end
end
