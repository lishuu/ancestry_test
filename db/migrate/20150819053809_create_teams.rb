class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :order_number

      t.timestamps null: false
    end
  end
end