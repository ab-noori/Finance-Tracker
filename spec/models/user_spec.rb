require 'rails_helper'

RSpec.describe User, type: :model do
  # Test 1: Validation - User is valid with valid attributes
  it 'is valid with valid attributes' do
    user = FactoryBot.build(:user, name: 'exampleuser', email: 'user@example.com', password: 'password')
    expect(user).to be_valid
  end

  # Test 2: Validation - User is not valid without a username
  it 'is not valid without a username' do
    user = FactoryBot.build(:user, name: nil, email: 'user@example.com', password: 'password')
    expect(user).to_not be_valid
  end

  # Test 3: Association - User has many categories
  it 'has many categories' do
    user = FactoryBot.create(:user)
    category1 = FactoryBot.create(:category, user:)
    category2 = FactoryBot.create(:category, user:)

    expect(user.categories).to include(category1, category2)
  end
end
