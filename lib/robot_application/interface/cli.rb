# frozen_string_literal: true

require "optparse"

module RobotApplication
  class Interface
    class Cli 
      Params = Struct.new(:width, :height, :renderer)

      def self.parse_params(arguments = ARGV, &block)
        params = Params.new

        OptionParser.new do |opts|
          opts.banner = "Usage: bin/robot_challenge [params]"

          opts.on("-w", "--width WIDTH", "Table width") do |width|
            params.width = width;
          end

          opts.on("-i", "--height HEIGHT", "Table height") do |height|
            params.height = height;
          end

          opts.on("-r", "--renderer RENDERER", [:null, :ascii], "Table renderer to use (null, ascii)") do |renderer|
            params.renderer = renderer;
          end

          opts.on("-h", "--help", "Show this message") do
            puts opts
            exit
          end
        end.parse!(arguments)

        block_given? ? yield(params) : params
      end
    end
  end
end
