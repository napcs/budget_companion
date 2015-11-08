class Income < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  
  has_many :income_payments, as: :incomePayable

  validates :income_source, presence: true
end
