require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "model validations" do
    describe "presence_of validations" do
      required_attributes = [:title, :location, :date]
      required_attributes.each do |attribute|
        it "requires #{attribute}" do
          event = build :event
          event[attribute] = nil
          event.valid?
          expect(event.errors.keys).to include(attribute)
        end
      end
    end
    describe "unique validations" do
      it "requires a title, date and location combination to be unique" do
        create :event
        event = build :event, description: "Climbing!"
        event.valid?
        expect(event.errors.keys).to include(:title)
      end

      it "will persist an event with the title and location the same but the date different" do
        create :event
        event = build :event, date: "2015-10-25"
        event.valid?
        expect(event.errors.keys).to_not include(:title)
      end
    end
  end
end
