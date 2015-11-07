class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.text :name
      t.text :category
      t.decimal :amount
      t.date :dueDate
      t.date :paymentDate
      t.decimal :lateFee, default: 0
      t.decimal :apr, default: 0
      t.boolean :paid, default: false

      t.timestamps null: false
    end
  end
end
