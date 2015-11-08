class AddAccountIdToGoals < ActiveRecord::Migration
  def change
    add_reference :goals, :account, index: true, foreign_key: true
  end
end
