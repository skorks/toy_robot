module RobotApplication
  class Table
    attr_reader :width, :height
    attr_accessor :robot

    def initialize(width:, height:)
      @width = width
      @height = height
      @robot = nil
    end

    def containsRobot?
      @robot
    end
  end
end
