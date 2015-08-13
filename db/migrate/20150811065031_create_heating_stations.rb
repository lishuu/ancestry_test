class CreateHeatingStations < ActiveRecord::Migration
  def change
    create_table :heating_stations do |t|
      t.string :name
      t.string :code
      t.integer :district_id
      t.integer :charging_area_id

      t.timestamps null: false
    end
  end
end
