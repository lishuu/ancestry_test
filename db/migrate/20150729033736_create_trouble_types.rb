class CreateTroubleTypes < ActiveRecord::Migration
  def change
    create_table :trouble_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
