# spec/factories/categories.rb

FactoryBot.define do
  factory :category, class: Category do
    name { 'Sample Category' }
    association :user, factory: :user
  end
end
