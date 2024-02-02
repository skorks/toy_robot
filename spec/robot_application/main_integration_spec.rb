# frozen_string_literal: true

require "spec_helper"

RSpec.describe RobotApplication::Main do
  let(:main) { described_class.new(dependency_container:) }
  let(:dependency_container) do
    RobotApplication::DependencyContainer.new({
      width: width,
      height: height,
      renderer: :null,
      input_reader: input_reader,
      input_parser_class: RobotApplication::InputParser,
    })
  end

  let(:width) { 5 }
  let(:height) { 5 }
  let(:input_reader) { RobotApplication::InputReader::Stdin.new(input_io: input_io) }
  let(:input_io) do
    StringIO.new.tap do |string_io|
      input_data.each do |entry|
        string_io.puts entry
      end
      string_io.rewind
      string_io
    end
  end
  let(:input_data) do
    [
      "report", "move", "place 1,1,north", "foobar", "report", "move", "move",
      "report", "right", "report", "move", "move", "report", "place 0,0,east",
      "move", "report", "place 0,0,south", "report", "move", "move",
      "report", "left", "left", "report", "move", "report"
    ]
  end
  let(:output_io) { StringIO.new }
  let(:expected_output) do
    [
      "Invalid command given FOOBAR", "1,1,NORTH", "1,3,NORTH", "1,3,EAST",
      "3,3,EAST", "1,0,EAST", "0,0,SOUTH", "0,0,SOUTH", "0,0,NORTH",
      "0,1,NORTH", ""
    ].join("\n")
  end

  describe "#execute" do
    before do
      $stdout = output_io
      $stderr = output_io
    end

    after do
      $stdout = STDOUT
      $stderr = STDERR
    end

    it "produces the expected output" do
      main.execute
      expect(output_io.string).to eq expected_output
    end
  end
end
