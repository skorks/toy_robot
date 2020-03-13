# frozen_string_literal: true

require "robot_application/command_factory"

module RobotApplication
  module InputParser
    class TextCommand
      attr_reader :command_factory

      def initialize(command_factory: CommandFactory.new)
        @command_factory = command_factory
      end

      def parse(input_string:)
        input_tokens = input_string.downcase.split(/\s+/, 2)
        type = (input_tokens[0] || "").to_sym
        arguments = (input_tokens[1] || "").split(/,\s*/)
        [command_factory.build(type: type, arguments: arguments)]
      end
    end
  end
end
