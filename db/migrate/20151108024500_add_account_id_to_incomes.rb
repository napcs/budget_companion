class AddAccountIdToIncomes < ActiveRecord::Migration
  def change
    add_reference :incomes, :account, index: true, foreign_key: true
  end
end
