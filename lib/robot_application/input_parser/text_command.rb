# frozen_string_literal: true

require "robot_application/command_factory"

module RobotApplication
  class InputParser
    class TextCommand
      def parse(input_string:)
        input_tokens = input_string.downcase.split(/\s+/, 2)
        type = (input_tokens[0] || "").to_sym
        arguments = (input_tokens[1] || "").split(/,\s*/)
        CommandDetails.new(type: type, raw_arguments: arguments)
      end

      CommandDetails = Struct(:type, :raw_arguments)
    end
  end
end
