# frozen_string_literal: true

require "spec_helper"

RSpec.describe RobotApplication::Utils::Integer do
  let(:utils) { described_class }

  describe "::parse" do
    let(:parse) { utils.parse(value: value, default: default) }
    let(:value) { 1 }
    let(:default) { 0 }

    context "when valid integer" do
      let(:value) { "5" }

      context "and default is provided" do
        let(:default) { 0 }

        it do
          expect(parse).to be 5
        end
      end

      context "and no default is provided" do
        let(:parse) { utils.parse(value: value) }

        it do
          expect(parse).to be 5
        end
      end
    end

    context "when not a valid integer" do
      let(:value) { "abc" }

      context "and default is provided" do
        let(:default) { 3 }

        it do
          expect(parse).to be 3
        end
      end

      context "and no default is provided" do
        let(:parse) { utils.parse(value: value) }

        it do
          expect(parse).to be 0
        end
      end
    end

    context "when nil" do
      let(:value) { nil }

      context "and default is provided" do
        let(:default) { 3 }

        it do
          expect(parse).to be 3
        end
      end

      context "and no default is provided" do
        let(:parse) { utils.parse(value: value) }

        it do
          expect(parse).to be 0
        end
      end
    end
  end
end
