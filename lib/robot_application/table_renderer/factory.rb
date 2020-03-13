# frozen_string_literal: true

require "robot_application/table_renderer/stdout_ascii"
require "robot_application/table_renderer/null"

module RobotApplication
  module TableRenderer
    class Factory
      DEFAULT_RENDERER_KEY = :null
      MAPPING = {
        ascii: TableRenderer::StdoutAscii,
        DEFAULT_RENDERER_KEY => TableRenderer::Null,
      }.freeze

      class << self
        def types
          MAPPING.keys
        end
      end

      def build(type:)
        (MAPPING[type.downcase.to_sym] || MAPPING[:null]).new
      end
    end
  end
end
