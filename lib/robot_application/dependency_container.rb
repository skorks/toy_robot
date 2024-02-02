# frozen_string_literal: true

require "robot_application/utils/integer"
require "robot_application/robot"
require "robot_application/table"
require "robot_application/compass"
require "robot_application/input_reader/readline"
require "robot_application/input_parser"
require "robot_application/table_renderer/factory"
require "robot_application/command_factory"

module RobotApplication
  class DependencyContainer
    def initialize(config)
      @config = default_config.merge(config.to_h)
    end

    def fetch(*keys)
      keys.map { |key| public_send(key) }
    end

    def table
      @table ||= @config[:table_class].new(width: table_width, height: table_height)
    end

    def robot
      @robot ||= @config[:robot_class].new
    end

    def compass
      @compass ||= @config[:compass_class].new
    end

    def input_reader
      @input_reader ||= (@config[:input_reader] || @config[:input_reader_class].new)
    end

    def input_parser
      @input_parser ||= (@config[:input_parser] || @config[:input_parser_class].new(command_factory: command_factory))
    end

    def table_renderer
      @table_renderer ||= (@config[:table_renderer] || TableRenderer::Factory.new.build(type: @config[:renderer]))
    end

    def table_width
      @table_width ||= Utils::Integer.parse(value: @config[:width], default: Table::DEFAULT_WIDTH)
    end

    def table_height
      @table_height ||= Utils::Integer.parse(value: @config[:height], default: Table::DEFAULT_HEIGHT)
    end

    def command_factory
      @command_factory ||= @config[:command_factory_class].new
    end

    private

    def default_config
      {
        width: Table::DEFAULT_WIDTH,
        height: Table::DEFAULT_HEIGHT,
        renderer: TableRenderer::Factory::DEFAULT_RENDERER_KEY,
        table_class: Table,
        robot_class: Robot,
        compass_class: Compass,
        command_factory_class: CommandFactory,
        input_parser_class: InputParser,
        input_reader_class: InputReader::Readline,
        input_reader: nil,
        input_parser: nil,
        table_renderer: nil,
      }
    end
  end
end
