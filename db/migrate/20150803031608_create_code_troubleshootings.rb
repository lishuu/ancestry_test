class CreateCodeTroubleshootings < ActiveRecord::Migration
  def change
    create_table :code_troubleshootings do |t|
      t.string :name
      t.string :code
      t.integer :trouble_type_id
      t.text :shooting
      t.integer :order_num

      t.timestamps null: false
    end
  end
end
