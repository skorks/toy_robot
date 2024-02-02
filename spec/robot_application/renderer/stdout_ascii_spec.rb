# frozen_string_literal: true

require "spec_helper"

RSpec.describe RobotApplication::TableRenderer::StdoutAscii do
  let(:renderer) { described_class.new }

  describe "#render" do
    context "when valid inputs given" do
      let(:dependency_container) do
        double(:dependency_container, table: table, robot: robot, compass: compass, fetch: [robot, table, compass])
      end
      let(:table) { double(:table, width: 5, height: 5) }
      let(:robot) { double(:table, x: 0, y: 0, direction: :north, idle?: true) }
      let(:compass) { double(:compass, :[] => nil) }

      # smoke test
      it "doesn't blow up" do
        $stdout = StringIO.new
        expect { renderer.render(dependency_container:) }.not_to raise_error
        $stdout = STDOUT
      end
    end
  end
end
