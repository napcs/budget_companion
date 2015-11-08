class DropIncomePayments < ActiveRecord::Migration
  def self.up
    if ActiveRecord::Base.connection.table_exists? :income_payments
      drop_table :income_payments
    end
  end

  def self.down
    create_table :income_payments do |t|
      t.decimal :gross_income
      t.decimal :net_income
      t.date :paymentDate

      t.timestamps null: false
    end
  end
end
