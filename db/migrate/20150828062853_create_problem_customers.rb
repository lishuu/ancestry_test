class CreateProblemCustomers < ActiveRecord::Migration
  def change
    create_table :problem_customers do |t|
      t.string :workorder_no
      t.integer :customer_id
      t.integer :meter_brand_id
      t.string :past_meterno
      t.string :changing_meterno
      t.float :past_basenum
      t.float :post_val
      t.float :current_basenum
      t.float :current_val
      t.integer :team_id
      t.integer :troubleshooting_id
      t.string :analysis
      t.string :solving

      t.timestamps null: false
    end
  end
end
