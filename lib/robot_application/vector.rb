require "robot_application/integer"

module RobotApplication
  class Vector
    # NAMED_COMPONENTS = {
    #   east: { x: 1, y: 0 },
    #   north: { x: 0, y: 1 },
    #   west: { x: -1, y: 0 }, 
    #   south: { x: 0, y: -1 },
    # }
    # NAMED_COMPONENT_SHIFT_DEGREES = 90

    # class << self
    #   def [](key)
    #     components = NAMED_COMPONENTS[key.downcase.to_sym]
    #     new(**components) if components
    #   end
    # end

    attr_reader :x, :y

    def initialize(x:, y:)
      @x = x
      @y = y
    end

    def ==(another_vector)
      another_vector.class == self.class && another_vector.components == components
    end
    alias_method :eql?, :==

    def hash
      components.hash
    end

    def to_s
      # (NAMED_COMPONENTS.invert[self.components] || components.values.join(",")).to_s.upcase
      components.values.join(",").to_s.upcase
    end

    def clone
      self.class.new(**components)
    end

    def components
      { x: x, y: y }
    end

    def magnitude
      @magnitude ||= Math.sqrt(x.abs**2 + y.abs**2).to_i
    end

    def direction
      @direction ||= begin
        possible_direction = ((Math.atan(y.to_f/x)*180)/Math::PI).to_i
        if x < 0
          possible_direction += 180
        elsif y < 0
          possible_direction += 360
        end
        possible_direction
      end
    end

    def shift_by(degrees:)
      new_direction = (direction + degrees).to_f
      new_x = Math.cos((new_direction/180)*Math::PI).round
      new_y = Math.sin((new_direction/180)*Math::PI).round
      self.class.new(x: new_x, y: new_y)
    end
  end
end
