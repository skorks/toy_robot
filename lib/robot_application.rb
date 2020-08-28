# frozen_string_literal: true

require "robot_application/command_line_interface"
require "robot_application/main"

module RobotApplication
  class << self
    def execute
      Signal.trap("INT") { exit } # trap ^C to prevent ugly Interrupt stracktrace
      CommandLineInterfact.new.parse_options do |options|
        Main.new(table_width: options.width, table_height: options.height, table_renderer: options.renderer).execute
      end
    end
  end
end
