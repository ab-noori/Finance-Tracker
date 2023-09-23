# spec/models/expense_category_association_spec.rb

require 'rails_helper'

RSpec.describe ExpenseCategoryAssociation, type: :model do
  describe 'associations' do
    it 'belongs to an expense' do
      association = described_class.reflect_on_association(:expense)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to a category' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'validations' do
    it 'is not valid without an expense' do
      category = FactoryBot.create(:category)
      association = ExpenseCategoryAssociation.new(category:)
      expect(association).to_not be_valid
    end

    it 'is not valid without a category' do
      expense = FactoryBot.create(:expense)
      association = ExpenseCategoryAssociation.new(expense:)
      expect(association).to_not be_valid
    end
  end
end
