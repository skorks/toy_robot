# frozen_string_literal: true

require "robot_application/robot_command/directed_move/base"

module RobotApplication
  module RobotCommand
    module DirectedMove
      class East < Base
        def new_coordinates
          { x: robot.x + 1, y: robot.y }
        end
      end
    end
  end
end
