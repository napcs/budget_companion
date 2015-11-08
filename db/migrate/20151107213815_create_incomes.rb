class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.text :income_source
      t.text :category
      t.decimal :gross_income
      t.decimal :net_income
      t.text :bank_account

      t.timestamps null: false
    end
  end
end
