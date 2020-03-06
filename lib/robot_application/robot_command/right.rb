# frozen_string_literal: true

require "robot_application/robot_command/base"

module RobotApplication
  module RobotCommand
    class Right < Base
      def execute(robot:, table:)
        return if robot.idle?

        robot.update_position(position: Table::Position.new(
          cell: robot.position.cell,
          direction: (robot.position.direction + 1) % 4,
        ))
      end
    end
  end
end
