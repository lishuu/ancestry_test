class CreateHeatingStatuses < ActiveRecord::Migration
  def change
    create_table :heating_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
