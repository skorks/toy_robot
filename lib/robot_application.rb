# frozen_string_literal: true

# require "robot_application/interface/cli"
# require "robot_application/main"
# require "robot_application/input_reader/stdin"
# require "robot_application/input_parser/text_command"
# require "robot_application/output_writer/console"
# require "robot_application/command_factory"

require "robot_application/vector"
require "robot_application/position"
require "robot_application/vector_position"

module RobotApplication
  # class << self
  #   def execute
  #     Signal.trap("INT") { exit } # trap ^C to prevent ugly Interrupt stacktrace
  #     Interface::Cli.parse_params do |params|
  #       Main.configure do |config|
  #         config.table_width = params.width
  #         config.table_height = params.height
  #         config.table_renderer = params.renderer
  #         config.input_reader = InputReader::Stdin.new
  #         config.input_parser = InputParser::TextCommand.new
  #         config.output_writer = OutputWriter::Console.new
  #         config.command_factory = CommandFactory.new(output_writer: config.output_writer)
  #       end.execute
  #     end
  #   end
  # end
end
