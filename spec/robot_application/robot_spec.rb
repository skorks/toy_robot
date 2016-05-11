require "spec_helper"

RSpec.describe RobotApplication::Robot do
  let(:robot) { described_class.new }
  let(:x) { 1 }
  let(:y) { 2 }
  let(:facing) { RobotApplication::FacingDirection::NORTH }

  describe "#set_position" do
    let(:set_position) { robot.set_position(x: x, y: y, facing: facing) }

    it "has the correct x position" do
      expect(set_position.x).to eq x
    end

    it "has the correct y position" do
      expect(set_position.y).to eq y
    end

    it "has the correct facing direction" do
      expect(set_position.facing).to eq facing
    end

    context "when facing direction is not supplied" do
      let(:set_position) { robot.set_position(x: x, y: y) }

      it "has the default facing direction" do
        expect(set_position.facing).to eq RobotApplication::FacingDirection::NORTH
      end
    end
  end
end
