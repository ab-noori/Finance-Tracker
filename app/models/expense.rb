class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_category_associations
  has_many :categories, through: :expense_category_associations
end
