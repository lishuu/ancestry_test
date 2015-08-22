class Maintenance < ActiveRecord::Base
	attr_accessor :is_sync

	validates :customer_id, :worker, :work_date, :hv, presence: true
	belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
	belongs_to :meter_status, class_name: 'MeterStatus', foreign_key: 'meter_status_id'
	belongs_to :team, class_name: 'Team', foreign_key: 'team_id'

	after_save :sync_to_customer

private
	def sync_to_customer
		if is_sync.to_i == 1
			current_customer = Customer.find(self.customer_id)
			current_customer.hv_current = self.hv
			current_customer.meter_status_id = self.meter_status.id
			current_customer.save!
		end
	end
end
