# frozen_string_literal: true

require "optparse"
require "robot_application/table_renderers/null_table_renderer"
require "robot_application/table_renderers/stdout_ascii_table_renderer"

module RobotApplication
  class CommandLineInterfact
    class Options
      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def width
        Integer(options[:width] || 5)
      end

      def height
        Integer(options[:height] || 5)
      end

      def renderer
        if options[:renderer] == :ascii
          TableRenderers::StdoutAsciiTableRenderer.new
        else
          TableRenderers::NullTableRenderer.new
        end
      end
    end

    attr_reader :arguments

    def initialize(arguments = nil)
      @arguments = arguments || ARGV
    end

    # rubocop:disable Metrics/MethodLength
    def parse_options(&_block)
      options = {}
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: bin/robot_challenge [options]"

        opts.on("-w", "--width WIDTH", "Table width") do |width|
          options[:width] = width
        end

        opts.on("-i", "--height HEIGHT", "Table height") do |height|
          options[:height] = height
        end

        opts.on("-r", "--renderer RENDERER", %i[null ascii], "Table renderer to use (null, ascii)") do |renderer|
          options[:renderer] = renderer
        end

        opts.on("-h", "--help", "Show this message") do
          puts opts
          exit
        end
      end
      parser.parse!

      if block_given?
        yield(Options.new(options))
      else
        Options.new(options)
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
