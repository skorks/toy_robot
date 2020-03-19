# frozen_string_literal: true

require "robot_application/robot"
require "robot_application/table"

module RobotApplication
  class Main
    attr_reader :configuration, :robot, :table

    def initialize(configuration:)
      @configuration = configuration
      @robot = Robot.new
      @table = Table.new(width: configuration.table_width, height: configuration.table_height)
    end

    def execute
      configuration.input_reader.each do |input_string|
        commands = configuration.input_parser.parse(input_string: input_string)
        commands.each do |command|
          command.execute(robot: robot, table: table)
          # it's nice to have a visual representation
          configuration.table_renderer.render(robot: robot, table: table)
        end
      end
    end
  end
end
