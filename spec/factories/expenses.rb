# spec/factories/expenses.rb

FactoryBot.define do
  factory :expense, class: Expense do
    name { 'Sample Expense' }
    amount { 50.0 }
    association :user, factory: :user
  end
end
