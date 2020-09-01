# frozen_string_literal: true

require "spec_helper"
require "shellwords"

RSpec.describe RobotApplication::Interface::Cli do
  let(:cli) { described_class }
  let(:arguments) { Shellwords.shellwords("") }

  describe "::parse" do
    let(:parse) { described_class.parse(arguments) }

    context "when help is requested" do
      let(:arguments) { Shellwords.shellwords("-h") }
      let(:console_output) { StringIO.new }

      it "outputs the help to the console" do
        begin
          $stdout = console_output
          parse
        rescue SystemExit
        ensure
          $stdout = STDOUT
        end
        expect(console_output.string).to match(/Usage/)
      end

      it "exits the application" do
        $stdout = console_output
        expect { parse }.to raise_error(SystemExit)
        $stdout = STDOUT
      end
    end

    context "when relevant arguments provided" do
      let(:arguments) { Shellwords.shellwords("-w #{width} -i #{height} -r #{renderer}") }
      let(:width) { "3" }
      let(:height) { "4" }
      let(:renderer) { :null }

      it "returns the expected params" do
        expect(parse.width).to eql width
      end

      it "returns the expected params" do
        expect(parse.height).to eql height
      end

      it "returns the expected params" do
        expect(parse.renderer).to eql renderer
      end
    end

    context "when no arguments are provided" do
      let(:arguments) { Shellwords.shellwords("") }

      it "returns the expected params" do
        expect(parse.width).to be_nil
      end

      it "returns the expected params" do
        expect(parse.height).to be_nil
      end

      it "returns the expected params" do
        expect(parse.renderer).to be_nil
      end
    end
  end
end
