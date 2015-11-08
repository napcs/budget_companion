class IncomePayment < ActiveRecord::Base
  belongs_to :income
  validates :net_amount, presence: true
  validates :payment_date, presence: true
end
