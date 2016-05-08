module RobotApplication
  class CommandFactory
    class RobotCommand
      attr_reader :type, :arguments

      def initialize(type:, arguments: [])
        @type = type
        @arguments = arguments
      end

      def execute(robot:, table:)
        raise Error.new("Base command #{self.class.name} should not be used directly")
      end
    end
    class PlaceRobotCommand < RobotCommand
      def execute(robot:, table:)
      end
    end
    class MoveRobotCommand < RobotCommand
      def execute(robot:, table:)
      end
    end
    class TurnLeftRobotCommand < RobotCommand
      def execute(robot:, table:)
      end
    end
    class TurnRightRobotCommand < RobotCommand
      def execute(robot:, table:)
      end
    end
    class ReportRobotCommand < RobotCommand
      def execute(robot:, table:)
      end
    end
    class NullRobotCommand < RobotCommand
      def execute(robot:, table:)
      end
    end

    # make sure we keep the keys as strings by using the hashrocket syntax
    COMMAND_MAPPING = {
      "PLACE" => PlaceRobotCommand,
      "MOVE" => MoveRobotCommand,
      "LEFT" => TurnLeftRobotCommand,
      "RIGHT" => TurnRightRobotCommand,
      "REPORT" => ReportRobotCommand,
    }

    def build(type:, arguments: [])
      command_class = COMMAND_MAPPING[type]

      if command_class
        command_class.new(type: type, arguments: arguments)
      else
        # we can invert this dependency if we want to test it, etc.
        $stderr.puts "Invalid command given #{type}"
        NullRobotCommand.new(type: type, arguments: arguments)
      end
    end
  end
end
