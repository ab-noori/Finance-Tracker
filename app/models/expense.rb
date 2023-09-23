class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_category_associations
  has_many :categories, through: :expense_category_associations

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
