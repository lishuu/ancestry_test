class CreateMeterStatuses < ActiveRecord::Migration
  def change
    create_table :meter_statuses do |t|
      t.string :name
      t.string :remark
      t.integer :order_num

      t.timestamps null: false
    end
  end
end
