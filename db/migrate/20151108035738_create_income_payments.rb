class CreateIncomePayments < ActiveRecord::Migration
  def change
    create_table :income_payments do |t|
      t.decimal :gross_income
      t.decimal :net_income
      t.date :paymentDate

      t.timestamps null: false
    end
  end
end
