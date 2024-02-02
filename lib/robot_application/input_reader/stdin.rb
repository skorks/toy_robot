# frozen_string_literal: true

module RobotApplication
  module InputReader
    class Stdin
      include Enumerable

      def initialize(input_io: $stdin)
        @input_io = input_io
      end

      def each(&_block)
        while (line = @input_io.gets)
          yield(line.chomp)
        end
      end
    end
  end
end
