class CreateMeterBrands < ActiveRecord::Migration
  def change
    create_table :meter_brands do |t|
      t.string :name
      t.string :supplier
      t.string :contact
      t.string :phone
      t.integer :order_num

      t.timestamps null: false
    end
  end
end
