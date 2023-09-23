require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = FactoryBot.create(:user)
      expense = Expense.new(name: 'Groceries', amount: 50.0, user:)
      expect(expense).to be_valid
    end

    it 'is not valid without a name' do
      user = FactoryBot.create(:user)
      expense = Expense.new(amount: 50.0, user:)
      expect(expense).to_not be_valid
    end

    it 'is not valid without an amount' do
      user = FactoryBot.create(:user)
      expense = Expense.new(name: 'Groceries', user:)
      expect(expense).to_not be_valid
    end

    it 'is not valid with a non-positive amount' do
      user = FactoryBot.create(:user)
      expense = Expense.new(name: 'Groceries', amount: -10.0, user:)
      expect(expense).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many expense category associations' do
      association = described_class.reflect_on_association(:expense_category_associations)
      expect(association.macro).to eq :has_many
    end
  end
end
