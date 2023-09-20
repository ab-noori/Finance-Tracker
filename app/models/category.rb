class Category < ApplicationRecord
  belongs_to :user
  has_many :expense_category_associations
  has_one_attached :icon, dependent: :destroy
  has_many :expenses, through: :expense_category_associations
end
