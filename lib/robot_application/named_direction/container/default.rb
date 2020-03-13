# frozen_string_literal: true

module RobotApplication
  module NamedDirection
    module Container
      class Default
        ALL = {
          north: 0,
          east: 90,
          south: 180,
          west: 270,
        }.freeze

        ALL_INVERTED = ALL.invert
      end
    end
  end
end
