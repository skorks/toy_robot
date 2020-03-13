# frozen_string_literal: true

require "robot_application/robot_command/directed_move/base"

module RobotApplication
  module RobotCommand
    module DirectedMove
      class South < Base
        def new_position
          @new_position = robot.position.increment(y: -1)
        end
      end
    end
  end
end
