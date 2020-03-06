# frozen_string_literal: true

module RobotApplication
  class OutputWriter 
    class Console 
      def message(string)
        $stdout.puts string
      end

      def error(string)
        $stderr.puts string
      end
    end
  end
end
