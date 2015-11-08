class ExpensePayment < ActiveRecord::Base
  belongs_to :expense
  validates :amount, presence: true
end
