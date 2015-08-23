class CreateMeterChangings < ActiveRecord::Migration
  def change
    create_table :meter_changings do |t|
      t.integer :customer_id
      t.integer :team_id
      t.string :worker
      t.string :work_date
      t.string :datetime
      t.string :past_no
      t.float :past_val
      t.string :current_no
      t.float :current_val
      t.string :remark

      t.timestamps null: false
    end
  end
end
