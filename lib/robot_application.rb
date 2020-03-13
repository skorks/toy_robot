# frozen_string_literal: true

require "robot_application/utils/integer"
require "robot_application/interface/cli"
require "robot_application/table_renderer/factory"
require "robot_application/main"

module RobotApplication
  class << self
    def execute
      Signal.trap("INT") { exit } # trap ^C to prevent ugly Interrupt stracktrace

      Interface::Cli.parse do |params|
        Main.new(
          table_width: Utils::Integer.parse(value: params.width || Table::DEFAULT_WIDTH),
          table_height: Utils::Integer.parse(value: params.height || Table::DEFAULT_HEIGHT),
          table_renderer: TableRenderer::Factory.new.build(type: params.renderer || TableRenderer::Factory::DEFAULT_RENDERER_KEY),
        ).execute
      end
    end
  end
end
