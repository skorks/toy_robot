module RobotApplication
  class InputParser
    class DummyCommand
      attr_reader :type, :arguments

      def initialize(type:, arguments:)
        @type = type
        @arguments = arguments
      end

      def execute(robot:, table:)
      end
    end

    def parse(input_string:)
      input_tokens = input_string.upcase.split(/\s+/, 2)
      type = (input_tokens[0] || "")
      arguments = (input_tokens[1] || "").split(/,\s*/)
      DummyCommand.new(type: type, arguments: arguments)
    end
  end
end
