# frozen_string_literal: true

require "robot_application/command/base"
require "robot_application/compass"

module RobotApplication
  module Command
    class Move < Base
      class Base
        attr_reader :robot, :table

        def initialize(dependency_container:)
          @robot = dependency_container.robot
          @table = dependency_container.table
        end

        def next_position
          { x: robot.x, y: robot.y }
        end

        def execute
          robot.update_position(**next_position) if table.valid_position?(**next_position)
        end
      end

      class North < Base
        def next_position
          { x: robot.x, y: robot.y + 1 }
        end
      end

      class East < Base
        def next_position
          { x: robot.x + 1, y: robot.y }
        end
      end

      class South < Base
        def next_position
          { x: robot.x, y: robot.y - 1 }
        end
      end

      class West < Base
        def next_position
          { x: robot.x - 1, y: robot.y }
        end
      end

      def execute(dependency_container:)
        robot = dependency_container.robot
        return if robot.idle?

        # using naming convention here to find and instantiate relavant
        # classes that implement direction moves, could use a lookup table
        # similar to what we do in CommandFactory, if we want complete
        # control of class names
        class_prefix = Compass.new.name_for(robot.direction).downcase.capitalize
        class_name = RobotApplication::Command::Move.const_get(class_prefix)
        class_name.new(dependency_container:).execute
      end
    end
  end
end
