require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'model validations' do
    describe 'name validations' do
      it 'requires a name' do
        schedule = build :schedule, name: nil

        schedule.valid?
        expect(schedule.errors.keys).to include(:name)
      end
    end

    describe 'description validations' do
      it 'requires a description' do
        schedule = build :schedule, description: nil

        schedule.valid?
        expect(schedule.errors.keys).to include(:description)
      end
    end
  end
end
