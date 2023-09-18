class Category < ApplicationRecord
  belongs_to :user
  has_many :expense_category_associations
  has_many :expenses, through: :expense_category_associations
end
