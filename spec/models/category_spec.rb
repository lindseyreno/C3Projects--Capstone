require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'model validations' do
    describe 'name validations' do
      it 'requires a name' do
        category = build :category, name: nil

        category.valid?
        expect(category.errors.keys).to include(:name)
      end

      it 'requires name to be unique' do
        create :category
        category = build :category

        category.valid?
        expect(Category.count).to be 1
        expect(category.errors.keys).to include(:name)
      end
    end
  end
end
