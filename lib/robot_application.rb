# frozen_string_literal: true

require "robot_application/utils/integer"
require "robot_application/interface/cli"
require "robot_application/configuration/static"
require "robot_application/table_renderer/factory"
require "robot_application/input_reader/stdin"
require "robot_application/input_reader/readline"
require "robot_application/input_parser/text_command"
require "robot_application/turning_strategy/right_angle"
require "robot_application/named_direction/container/default"
require "robot_application/main"

module RobotApplication
  class << self
    def execute
      Signal.trap("INT") { exit } # trap ^C to prevent ugly Interrupt stracktrace

      params = Interface::Cli.parse
      configuration = Configuration::Static.build do |config|
        config.table_width = Utils::Integer.parse(value: params.width || Table::DEFAULT_WIDTH)
        config.table_height = Utils::Integer.parse(value: params.height || Table::DEFAULT_HEIGHT)
        config.table_renderer = TableRenderer::Factory.new.build(type: :null)
        config.input_reader = InputReader::Readline.new
        config.input_parser = InputParser::TextCommand.new(
          command_factory: CommandFactory.new(
            turning_strategy: TurningStrategy::RightAngle,
            named_directions: NamedDirection::Container::Default,
          ),
        )
      end
      Main.new(configuration: configuration).execute
    end
  end
end
