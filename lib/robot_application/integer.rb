module RobotApplication
  class Integer 
    class << self
      def parse(value:, default: 0)
        Integer(value)
      rescue ArgumentError 
        default
      end

      def positive?(value:)
        valid?(value: value) && value > 0
      end

      def valid?(value:)
        value.is_a?(::Integer)
      end
    end
  end
end
