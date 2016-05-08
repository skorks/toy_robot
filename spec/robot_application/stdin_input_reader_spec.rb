require "spec_helper"

RSpec.describe RobotApplication::StdinInputReader do
  let(:input_reader) { described_class.new(input_io: input_io) }
  let(:input_io) { StringIO.new("#{line1}\n#{line2}") }
  let(:line1) { "hello" }
  let(:line2) { "world" }
  let(:lines) { [line1, line2] }

  describe "#each" do
    it "yields the input line by line" do
      lines = input_reader.map { |line| line }
      expect(lines).to eq([line1, line2])
    end

    it "yielded lines don't contain newlines" do
      input_reader.each do |line|
        expect(line).to_not match(/\\n/)
      end
    end
  end
end
