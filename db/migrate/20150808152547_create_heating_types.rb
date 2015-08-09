class CreateHeatingTypes < ActiveRecord::Migration
  def change
    create_table :heating_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
