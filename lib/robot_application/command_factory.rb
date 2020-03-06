require "robot_application/robot_command/turn_left"
require "robot_application/robot_command/turn_right"
require "robot_application/robot_command/null"

module RobotApplication
  class CommandFactory
    attr_reader :output_writer

    def initialize(output_writer:)
      @output_writer = output_writer
    end

    def build(type:, arguments: [])
      derive_command_class_strategies = [CommandClass::Infer, CommandClass::Lookup, CommandClass::Null]
      command_type_symbol = type.downcase.to_sym

      command_class = derive_command_class_strategies.reduce(nil) do |acc, executor|
        acc.nil? ? executor.new(type: command_type_symbol).execute : acc
      end
      command_class.new(arguments: arguments)
    end

    class CommandClass
      class Base
        attr_reader :type

        def initialize(type:)
          @type = type
        end

        def execute
        end
      end

      class Infer < Base
        def execute
          if RobotApplication::RobotCommand.const_defined?(type.capitalize, false)
            RobotApplication::RobotCommand.const_get(type.capitalize, false)
          end
        end
      end

      class Lookup < Base
        COMMAND_MAPPING = {
          left: RobotCommand::TurnLeft,
          right: RobotCommand::TurnRight,
        }

        def execute
          COMMAND_MAPPING[type]
        end
      end

      class Null < Base
        def execute
          output_writer.message "Unknown command: #{type}"

          RobotCommand::Null
        end
      end
    end
  end
end
