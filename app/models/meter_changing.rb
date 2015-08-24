class MeterChanging < ActiveRecord::Base
	attr_accessor :is_sync

	validates :customer_id, :worker, :work_date, :past_no, :past_val, :current_no, :current_val, presence: true
  belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
  belongs_to :team, class_name: 'Team', foreign_key: 'team_id'
  default_scope -> { order(id: :desc) }

  after_save :sync_to_customer

private

  def sync_to_customer
   	if is_sync.to_i == 1
 			current_customer = Customer.find(self.customer_id)
			current_customer.meter_no = self.current_no
			current_customer.meter_base_num = self.current_val
			current_customer.save!
   	end 	
  end

end
