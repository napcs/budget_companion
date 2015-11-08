class AddIncomeIdToIncomePayments < ActiveRecord::Migration
  def change
    add_reference :income_payments, :income, index: true, foreign_key: true
  end
end
