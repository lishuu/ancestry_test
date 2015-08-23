class MeterChanging < ActiveRecord::Base
	attr_accessor :is_sync
	validates :customer_id, :worker, :work_date, :past_no, :past_val, :current_no, :current_val, presence: true
  belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
  belongs_to :team, class_name: 'Team', foreign_key: 'team_id'
end
