class IncomePayment < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  belongs_to :incomePayable, polymorphic: true
  
end
