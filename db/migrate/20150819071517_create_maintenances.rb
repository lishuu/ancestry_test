class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.integer :customer_id
      t.integer :team_id
      t.string :worker
      t.string :work_date
      t.string :date
      t.integer :meter_status_id
      t.float :hv
      t.string :remark

      t.timestamps null: false
    end
  end
end
