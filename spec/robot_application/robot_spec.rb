require "spec_helper"

RSpec.describe RobotApplication::Robot do
  let(:robot) { described_class.new }
  let(:x) { 1 }
  let(:y) { 2 }
  let(:direction) { RobotApplication::FacingDirection[:north] }
  let(:table) { double "table" }

  describe "#update_position" do
    before do
      robot.update_position(
        x: x,
        y: y,
        direction: direction,
        table: table,
      )
    end

    it "can update the x coordinate" do
      expect(robot.x).to eq x
    end

    it "can update the y coordinate" do
      expect(robot.y).to eq y
    end

    it "can update the direction" do
      expect(robot.direction).to eq direction
    end

    it "can update the table" do
      expect(robot.instance_variable_get(:@table)).to eq table
    end

    context "when only some of the parameters are supplied" do
      let(:new_x) { 200 }

      before do
        robot.update_position(x: new_x)
      end

      it "retains the old values for the other parameters" do
        expect(robot.y).to eq y
      end

      it "sets the given parameters" do
        expect(robot.x).to eq new_x
      end
    end
  end

  describe "#idle?" do
    context "when robot is not aware of a table" do
      it "is considered to be idle" do
        expect(robot.idle?).to be_truthy
      end
    end

    context "when robot is aware of a table" do
      before do
        robot.update_position(table: table)
      end

      it "is NOT considered to be idle" do
        expect(robot.idle?).to be_falsy
      end
    end
  end
end
