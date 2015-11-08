class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.date :start_date
      t.string :duration
      t.string :frequency
      t.decimal :desired_total, default: 0.0
      t.decimal :actual_total,  default: 0.0

      t.timestamps null: false
    end
  end
end
