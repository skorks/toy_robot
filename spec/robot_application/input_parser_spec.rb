require "spec_helper"

RSpec.describe RobotApplication::InputParser do
  let(:input_parser) { described_class.new }

  describe "#parse" do
    let(:parse) { input_parser.parse(input_string: input_string) }

    context "when input is a PLACE command" do
      let(:input_string) { "PLACE 1,2, NORTH" }

      it "parses the type of the input correctly" do
        expect(parse.type).to eq "PLACE"
      end

      it "parses the arguments of the input correctly" do
        expect(parse.arguments.length).to eq 3
      end

      context "and the input is not upper case" do
        let(:input_string) { "place 1,2, north" }

        it "and the type of the input is upcased" do
          expect(parse.type).to eq "PLACE"
        end

        it "and the facing direction is upcased" do
          expect(parse.arguments[2]).to eq "NORTH"
        end
      end
    end

    context "when input is a MOVE command" do
      let(:input_string) { "MOVE" }

      it "parses the type of the input correctly" do
        expect(parse.type).to eq "MOVE"
      end

      it "parses the arguments of the input correctly" do
        expect(parse.arguments.length).to eq 0
      end
    end

    context "when input is a LEFT command" do
      let(:input_string) { "LEFT" }

      it "parses the type of the input correctly" do
        expect(parse.type).to eq "LEFT"
      end

      it "parses the arguments of the input correctly" do
        expect(parse.arguments.length).to eq 0
      end
    end

    context "when input is a RIGHT command" do
      let(:input_string) { "RIGHT" }

      it "parses the type of the input correctly" do
        expect(parse.type).to eq "RIGHT"
      end

      it "parses the arguments of the input correctly" do
        expect(parse.arguments.length).to eq 0
      end
    end

    context "when input is a REPORT command" do
      let(:input_string) { "REPORT" }

      it "parses the type of the input correctly" do
        expect(parse.type).to eq "REPORT"
      end

      it "parses the arguments of the input correctly" do
        expect(parse.arguments.length).to eq 0
      end
    end
  end
end
