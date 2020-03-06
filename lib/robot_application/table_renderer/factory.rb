# frozen_string_literal: true

module RobotApplication
  module TableRenderer
    class Factory 
      MAPPING = {
        ascii: TableRenderer::StdoutAscii,
        null: TableRenderer::Null,
      }

      class << self 
        def types
          MAPPING.keys
        end
      end

      def build(type:)
        (MAPPING[type.to_sym] || MAPPING[:null]).new
      end
    end
  end
end