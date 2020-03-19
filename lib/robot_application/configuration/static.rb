module RobotApplication
  module Configuration 
    class Static
      class << self
        def build 
          new.tap do |config|
            yield(config) if block_given?
          end
        end
      end

      attr_accessor(
        :table_width, 
        :table_height, 
        :table_renderer,
        :input_reader, 
        :input_parser, 
        :command_factory,
      )
    end
  end	
end
