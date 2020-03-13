# frozen_string_literal: true

require "optparse"
require "robot_application/renderer/factory"

module RobotApplication
  class Interface
    class Cli
      Params = Struct.new(:width, :height, :renderer)
      RENDERER_TYPES = TableRenderer::Factory.types

      # rubocop:disable Metrics/MethodLength
      def self.parse(arguments = ARGV, &_block)
        params = Params.new

        OptionParser.new do |opts|
          opts.banner = "Usage: bin/robot_challenge [params]"

          opts.on("-w", "--width WIDTH", "Table width") do |width|
            params.width = width || 5
          end

          opts.on("-i", "--height HEIGHT", "Table height") do |height|
            params.height = height || 5
          end

          opts.on(
            "-r", "--renderer RENDERER",
            RENDERER_TYPES,
            "Table renderer to use (#{RENDERER_TYPES.join(', ')})"
          ) do |renderer|
            params.renderer = renderer
          end

          opts.on("-h", "--help", "Show this message") do
            puts opts
            exit
          end
        end.parse!(arguments)

        block_given? ? yield(params) : params
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
