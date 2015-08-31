class ProblemCustomer < ActiveRecord::Base
	validates :customer_id, :meter_brand_id, presence: true
	belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
	belongs_to :team, class_name: 'Team', foreign_key: 'team_id'
	belongs_to :meter_brand, class_name: 'MeterBrand', foreign_key: 'meter_brand_id'
  belongs_to :code_troubleshooting, class_name: 'CodeTroubleshooting'	, foreign_key: 'troubleshooting_id'
	default_scope -> { order(id: :desc) }
end
