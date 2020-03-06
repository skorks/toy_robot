require 'forwardable'

module RobotApplication
  class VectorPosition
    extend Forwardable

    attr_reader :position, :vector

    def initialize(position:, vector:)
      @position = position
      @vector = vector
    end

    def_delegators :position, :x, :y

    def increment_position(x:, y:)
      @position = position.increment(x: x, y: y)
      self
    end

    def shift_vector(degrees:)
      @vector = vector.shift_by(degrees: degrees)
      self
    end

    def clone
      self.class.new(position: position.clone, vector: vector.clone)
    end

    def to_s
      "#{position.to_s},#{vector.to_s}"
    end
  end
end
