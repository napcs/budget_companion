class AddDueDateToDataPoints < ActiveRecord::Migration
  def change
    add_column :data_points, :due_date, :date
  end
end
