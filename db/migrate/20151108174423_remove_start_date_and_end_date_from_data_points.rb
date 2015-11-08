class RemoveStartDateAndEndDateFromDataPoints < ActiveRecord::Migration
  def change
    remove_column :data_points, :start_date
    remove_column :data_points, :end_date
  end
end
