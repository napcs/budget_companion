class Expense < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: true
  validates :dueDate, presence: true
  validates :paymentDate, presence: true

end
