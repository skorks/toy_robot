module RobotApplication
  class Robot < Struct(:vector_position)
    extend Forwardable

    def_delegators :vector_position, :vector, :position, :x, :y, :to_s#, :increment_position, :shift_vector

    def ready?
      vector_position
    end

    PermittedDirectionDelta = Struct(:clockwise, :anticlockwise)

    class SupportedVectors
      class DefaultStrategy
        MAPPING = {
          east: {
            vector: Vector.new(x: 1, y: 0),
            permitted_direction_delta: PermittedDirectionDelta.new(
              clockwise: -90,
              anticlockwise: 90,
            )
          },
          north: {
            vector: Vector.new(x: 0, y: 1),
            permitted_direction_delta: PermittedDirectionDelta.new(
              clockwise: -90,
              anticlockwise: 90,
            )
          },
          west: {
            vector: Vector.new(x: -1, y: 0),
            permitted_direction_delta: PermittedDirectionDelta.new(
              clockwise: -90,
              anticlockwise: 90,
            )
          },
          south: {
            vector: Vector.new(x: 0, y: -1),
            permitted_direction_delta: PermittedDirectionDelta.new(
              clockwise: -90,
              anticlockwise: 90,
            )
          },
        }
      end

      attr_reader :supported_vectors

      def initialize(supported_vectors: DefaultStrategy::MAPPING)
        @supported_vectors = supported_vectors
        @vector_by_name = nil
        @name_by_vector = nil
        @permitted_direction_deltas_by_vector = nil
      end

      def find_vector(name:)
        vector_by_name[name.downcase.to_sym]
      end

      def find_name(vector:)
        name_by_vector[vector]
      end

      def next_clockwise(vector:)
        vector.shift_by(degrees: permitted_deltas_for(vector: vector).clockwise)
      end

      def next_anticlockwise(vector:)
        vector.shift_by(degrees: permitted_deltas_for(vector: vector).anticlockwise)
      end

      private

      def permitted_deltas_for(vector:)
        permitted_direction_deltas_by_vector.fetch(vector, PermittedDirectionDelta.new(
          clockwise: 0,
          anticlockwise: 0,
        ))
      end

      def vector_by_name
        @vector_by_name ||= supported_vectors.reduce({}) do |acc, (key, value)|
          acc[key] = value.fetch(:vector, nil)
          acc
        end
      end

      def name_by_vector
        @name_by_vector ||= vector_by_name.invert
      end

      def permitted_direction_deltas_by_vector 
        @permitted_direction_deltas_by_vector ||= supported_vectors.reduce({}) do |acc, (_key, value)|
          acc[value.fetch(:vector, nil)] = value.fetch(:permitted_direction_delta, nil)
          acc
        end
      end
    end
  end
end
