# frozen_string_literal: true

require "robot_application/robot_command/base"
require "robot_application/vector"

module RobotApplication
  class RobotCommand
    class Place < Base 
      def preconditions_met?
        table.covers_position?(position: arguments.vector_position.position) && arguments.vector_position.vector
      end

      def arguments
        @arguments ||= ArgumentParser.new(arguments: raw_arguments)
      end

      def execute_when_preconditions_met
        robot.vector_position = arguments.vector_position
      end

      def execute_when_preconditions_fail
        output_writer.error "Invalid coordinates or facing direction given"
      end

      class ArgumentParser
        attr_reader :arguments

        def initialize(arguments: [])
          arguments = arguments
        end

        def x
          Integer(arguments[0])
        rescue
          -1
        end

        def y
          Integer(arguments[1])
        rescue
          -1
        end

        def direction
          @direction ||= arguments[2].strip
        end

        def vector_position
          @vector_position ||= VectorPosition.new(position: Position.new(x: x, y: y), vector: Vector[direction])
        end
      end
    end
  end
end
