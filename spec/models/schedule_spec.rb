require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "model validations" do
    describe "name validations" do
      it "requires a name" do
        schedule = build :schedule, name: nil

        schedule.valid?
        expect(schedule.errors.keys).to include(:name)
      end

      it "requires name to be unique" do
        create :schedule
        schedule = build :schedule

        schedule.valid?
        expect(Schedule.count).to be 1
        expect(schedule.errors.keys).to include(:name)
      end
    end

    describe "description validations" do
      it "requires a description" do
        schedule = build :schedule, description: nil

        schedule.valid?
        expect(schedule.errors.keys).to include(:description)
      end

      it "requires description to be unique" do
        create :schedule
        schedule = build :schedule

        schedule.valid?
        expect(Schedule.count).to be 1
        expect(schedule.errors.keys).to include(:description)
      end
    end
  end
end
