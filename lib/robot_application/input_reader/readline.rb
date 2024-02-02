# frozen_string_literal: true

require "readline"

module RobotApplication
  module InputReader
    class Readline
      include Enumerable

      def each(&_block)
        while (line = ::Readline.readline("> ", true))
          yield(line.chomp)
        end
      end
    end
  end
end
