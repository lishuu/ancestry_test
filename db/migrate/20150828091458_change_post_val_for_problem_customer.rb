class ChangePostValForProblemCustomer < ActiveRecord::Migration
  def change
  	change_table :problem_customers do |t|
  		t.rename :post_val, :past_val
  	end
  end
end
