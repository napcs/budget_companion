class Expense < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: true
  validates :due_date, presence: true
  validates :payment_date, presence: true

  has_many :expense_payments, dependent: :destroy
end
