class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :meter_no
      t.integer :district_id
      t.integer :community_id
      t.integer :building_id
      t.integer :unit
      t.integer :floor
      t.integer :room
      t.integer :heating_status_id
      t.string :address

      t.timestamps null: false
    end
  end
end
