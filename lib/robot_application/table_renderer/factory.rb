# frozen_string_literal: true

require "robot_application/table_renderer/stdout_ascii"
require "robot_application/table_renderer/null"

module RobotApplication
  module TableRenderer
    class Factory
      DEFAULT_RENDERER_KEY = :null
      MAPPING = {
        :ascii => TableRenderer::StdoutAscii,
        DEFAULT_RENDERER_KEY => TableRenderer::Null,
      }.freeze

      class << self
        def types
          MAPPING.keys
        end
      end

      def build(type:)
        table_renderer_key = (type || DEFAULT_RENDERER_KEY).downcase.to_sym
        table_renderer_class = MAPPING[table_renderer_key] || MAPPING[DEFAULT_RENDERER_KEY]
        table_renderer_class.new
      end
    end
  end
end
