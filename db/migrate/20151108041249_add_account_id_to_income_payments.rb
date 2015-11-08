class AddAccountIdToIncomePayments < ActiveRecord::Migration
  def change
    add_reference :income_payments, :account, index: true, foreign_key: true
  end
end
