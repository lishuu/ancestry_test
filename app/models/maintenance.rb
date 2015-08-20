class Maintenance < ActiveRecord::Base
	validates :customer_id, :worker, :work_date, :hv, presence: true
	belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
	belongs_to :meter_status, class_name: 'MeterStatus', foreign_key: 'meter_status_id'
	belongs_to :team, class_name: 'Team', foreign_key: 'team_id'
end
