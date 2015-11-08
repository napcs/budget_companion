class Category < ActiveRecord::Base
  validates :title, presence: true
  has_many :expenses
  has_many :incomes
  has_many :income_payments
end
