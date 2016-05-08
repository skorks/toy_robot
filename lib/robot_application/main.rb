require "robot_application/robot"
require "robot_application/table"
require "robot_application/stdin_input_reader"
require "robot_application/input_parser"

module RobotApplication
  class Main
    attr_reader :input_reader, :input_parser, :robot, :table

    def initialize(table_width: 5, table_height: 5, input_reader: StdinInputReader.new, input_parser: InputParser.new)
      @robot = Robot.new
      @table = Table.new(width: table_width, height: table_height)
      @input_reader = input_reader
      @input_parser = input_parser
    end

    def execute
      input_reader.each do |input_string|
        command = input_parser.parse(input_string: input_string)
        command.execute(robot: robot, table: table)
      end
    end
  end
end
