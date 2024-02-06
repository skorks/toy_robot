# frozen_string_literal: true

module RobotApplication
  module InputParser
    class Default
      def initialize(command_factory:)
        @command_factory = command_factory
      end

      def parse(input_string:)
        input_tokens = input_string.downcase.split(/\s+/, 2)
        type = (input_tokens[0] || "").to_sym
        arguments = (input_tokens[1] || "").split(/,\s*/)
        [@command_factory.build(type: type, arguments: arguments)]
      end
    end
  end
end
