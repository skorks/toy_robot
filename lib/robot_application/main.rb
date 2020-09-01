# frozen_string_literal: true

require "robot_application/robot"
require "robot_application/table"
require "robot_application/input_reader/stdin"
require "robot_application/input_reader/readline"
require "robot_application/input_parser"
require "robot_application/table_renderer/null"

module RobotApplication
  class Main
    attr_reader :input_reader, :input_parser, :table_renderer, :robot, :table

    def initialize(table_width: 5, table_height: 5,
                   input_reader: RobotApplication::InputReader::Readline.new,
                   input_parser: InputParser.new,
                   table_renderer: TableRenderer::Null.new)
      @robot = Robot.new
      @table = Table.new(width: table_width, height: table_height)
      @input_reader = input_reader
      @input_parser = input_parser
      @table_renderer = table_renderer
    end

    def execute
      input_reader.each do |input_string|
        commands = input_parser.parse(input_string: input_string)
        commands.each do |command|
          command.execute(robot: robot, table: table)
          # it's nice to have a visual representation
          table_renderer.render(robot: robot, table: table)
        end
      end
    end
  end
end
