class CreateChargingAreas < ActiveRecord::Migration
  def change
    create_table :charging_areas do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
