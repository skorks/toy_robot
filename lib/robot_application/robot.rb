# frozen_string_literal: true

module RobotApplication
  class Robot
    attr_reader :position

    def initialize
      @position = nil
      @table = nil
    end

    def update_position(position: nil, table: nil)
      @position = position || @position
      @table = table || @table
    end

    def idle?
      @table.nil?
    end
  end
end
