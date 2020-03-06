module RobotApplication
  module InputReader
    class Stdin
      include Enumerable

      attr_reader :input_io

      def initialize(input_io: $stdin)
        @input_io = input_io
      end

      def each(&block)
        while(line = input_io.gets) do
          yield(line.chomp)
        end
      end
    end
  end
end
