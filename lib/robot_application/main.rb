require "robot_application/robot"
require "robot_application/table"
require "robot_application/table_renderer/stdout_ascii"
require "robot_application/table_renderer/null"

module RobotApplication
  class Main
    attr_reader :configuration, :robot, :table

    class << self
      def configure
        configuration = Configuration.new
        yield(configuration) if block_given?
        new(configuration: configuration)
      end
    end

    def initialize(configuration:)
      @configuration = configuration
      @robot = Robot.new
      @table = Table.new(width: configuration.table_width, height: configuration.table_height)
    end

    def execute
      configuration.input_reader.each do |command_data|
        command_details = configuration.input_parser.parse(command_data: command_data)
        command_class = configuration.command_factory.build(type: command_details.type)
        command_class.new(
          robot: robot, 
          table: table, 
          raw_arguments: command_details.raw_arguments,
          output_writer: configuration.output_writer,
        ).execute
        # configuration.table_renderer.render(robot: robot, table: table)
      end
    end

    class Configuration 
      attr_reader :table_width, :table_height, :table_renderer
      attr_accessor :input_reader, :input_parser, :output_writer, :command_factory

      def table_width=(raw_table_width)
        @table_width ||= parse_integer(value: raw_table_width, default: 5)
      end

      def table_height=(raw_table_height)
        @table_height ||= parse_integer(value: raw_table_height, default: 5)
      end

      def table_renderer=(raw_table_renderer)
        @table_renderer ||= {
          ascii: TableRenderer::StdoutAscii,
        }.fetch(raw_table_renderer.to_sym, TableRenderer::Null.new)
      end

      private
      
      def parse_integer(value:, default: 0)
        Integer(value)
      rescue ArgumentError 
        default
      end
    end
  end
end
