# frozen_string_literal: true

require "robot_application/dependency_container"
require "robot_application/interface/cli"
require "robot_application/main"

module RobotApplication
  class << self
    def execute
      Signal.trap("INT") { exit } # trap ^C to prevent ugly Interrupt stracktrace

      Interface::Cli.parse do |params|
        Main.new(dependency_container: DependencyContainer.new(params)).execute
      end
    end
  end
end
