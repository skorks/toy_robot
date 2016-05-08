require "robot_application/main"

module RobotApplication
  class << self
    def execute
      p "***************"
      Main.new.execute
      p "***************"
    end
  end
end
