class CreateCustomerTypes < ActiveRecord::Migration
  def change
    create_table :customer_types do |t|
      t.string :name
      t.integer :order_num

      t.timestamps null: false
    end
  end
end
