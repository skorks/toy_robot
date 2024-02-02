# frozen_string_literal: true

module RobotApplication
  class Main
    def initialize(dependency_container:)
      @dependency_container = dependency_container
      @input_reader = dependency_container.input_reader
      @input_parser = dependency_container.input_parser
      @table_renderer = dependency_container.table_renderer
    end

    def execute
      @input_reader.each do |input_string|
        commands = @input_parser.parse(input_string: input_string)
        commands.each do |command|
          command.execute(dependency_container: @dependency_container)
          # it's nice to have a visual representation
          @table_renderer.render(dependency_container: @dependency_container)
        end
      end
    end
  end
end
