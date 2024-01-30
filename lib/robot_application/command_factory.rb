# frozen_string_literal: true

# automatically require all commands in command folder except the base class
Dir[File.join(__dir__, "command", "*.rb")].each { |file| require file unless file.include?("base.rb") }

module RobotApplication
  class CommandFactory
    def build(type:, arguments: [])
      CommandClassService.new(type:).call.new(type:, arguments:)
    end

    class CommandClassService
      COMMAND_MAPPING = {
        left: RobotApplication::Command::TurnLeft,
        right: RobotApplication::Command::TurnRight,
      }.freeze

      def initialize(type:)
        @type = type
      end

      def call
        command_class_by_convention || command_class_by_lookup || null_command_class
      end

      private

      def command_class_by_convention
        if RobotApplication::Command.const_defined?(classified_command_type)
          RobotApplication::Command.const_get(classified_command_type)
        end
      end

      def command_class_by_lookup
        COMMAND_MAPPING[command_type_symbol]
      end

      def null_command_class
        RobotApplication::Command::NullLogger
      end

      def classified_command_type
        @classified_command_type ||= command_type_symbol.to_s.downcase.capitalize
      end

      def command_type_symbol
        @command_type_symbol ||= @type.downcase.to_sym
      end
    end
  end
end
