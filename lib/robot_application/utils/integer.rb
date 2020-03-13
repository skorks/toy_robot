# frozen_string_literal: true

module RobotApplication
  module Utils
    class Integer
      class << self
        def parse(value:, default: 0)
          Integer(value)
        rescue ArgumentError
          default
        end
      end
    end
  end
end
