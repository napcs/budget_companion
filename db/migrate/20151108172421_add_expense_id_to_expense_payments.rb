class AddExpenseIdToExpensePayments < ActiveRecord::Migration
  def change
    add_reference :expense_payments, :expense, index: true, foreign_key: true
  end
end
