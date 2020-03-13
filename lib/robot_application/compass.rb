# frozen_string_literal: true

module RobotApplication
  class Compass
    attr_reader :named_directions

    def initialize(named_directions: NamedDirection::Container::Default)
      @named_directions = named_directions
    end

    def name_for(angle:)
      named_directions::ALL_INVERTED[Utils::Integer.parse(value: angle, default: -1)]
    end

    def angle_for(name:)
      named_directions::ALL[name.downcase.to_sym]
    end
  end
end
