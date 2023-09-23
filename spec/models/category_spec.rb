require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it "is valid with a name" do
      category = FactoryBot.create(:category)
      expect(category).to be_valid
    end

    it "is invalid without a name" do
      category = Category.new
      expect(category).to_not be_valid
      expect(category.errors[:name]).to include("can't be blank")
    end
  end

  context "associations" do
    it "belongs to a user" do
      association = Category.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "has many expenses" do
      association = Category.reflect_on_association(:expenses)
      expect(association.macro).to eq(:has_many)
    end
  end
end
