class IncomePayment < ActiveRecord::Base
  
  belongs_to :incomePayable, polymorphic: true
  
end
