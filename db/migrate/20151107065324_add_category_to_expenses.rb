class AddCategoryToExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :category
    add_reference :expenses, :category, index: true, foreign_key: true
  end
end
