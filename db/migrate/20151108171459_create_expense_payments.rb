class CreateExpensePayments < ActiveRecord::Migration
  def change
    create_table :expense_payments do |t|
      t.decimal :amount
      t.datetime :due_date
      t.datetime :payment_date
      t.boolean :paid, default: false
      t.timestamps null: false
    end
  end
end
