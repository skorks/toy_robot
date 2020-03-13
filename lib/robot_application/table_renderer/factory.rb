# frozen_string_literal: true

module RobotApplication
  module TableRenderer
    class Factory
      MAPPING = {
        ascii: TableRenderer::StdoutAscii,
        null: TableRenderer::Null,
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
