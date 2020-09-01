# frozen_string_literal: true

module RobotApplication
  module Utils
    class Integer
      class << self
        def parse(value:, default: 0)
          Integer(value || default || 0)
        rescue ArgumentError
          default || 0
        end
      end
    end
  end
end
