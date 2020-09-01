# frozen_string_literal: true

require "spec_helper"

RSpec.describe RobotApplication::TableRenderer::Factory do
  describe "::types" do
    it "returns the type keys" do
      expect(described_class.types).to eql described_class::MAPPING.keys
    end
  end

  describe "#build" do
    let(:build) { described_class.new.build(type: type) }
    let(:type) { :null }

    context "when type is given as null" do
      let(:type) { nil }

      it do
        expect(build).to be_a RobotApplication::TableRenderer::Null
      end
    end

    context "when an invalid type is given" do
      let(:type) { "foo" }

      it do
        expect(build).to be_a RobotApplication::TableRenderer::Null
      end
    end

    context "when a valid type is given" do
      let(:type) { :ascii }

      it do
        expect(build).to be_a RobotApplication::TableRenderer::StdoutAscii
      end
    end
  end
end
