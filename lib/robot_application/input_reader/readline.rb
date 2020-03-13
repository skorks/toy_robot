# frozen_string_literal: true
require "readline"

module RobotApplication
  module InputReader
    class Readline
      include Enumerable

      attr_reader :input_io

      def initialize(input_io: $stdin)
        @input_io = input_io
      end

      def each(&_block)
        while (line = ::Readline.readline("> ", true))
          yield(line.chomp)
        end
      end
    end
  end
end
