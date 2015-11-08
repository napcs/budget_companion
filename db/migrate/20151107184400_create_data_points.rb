class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.integer :goal_id
      t.decimal :desired_amount, default: 0.0
      t.decimal :actual_amount,  default: 0.0
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
