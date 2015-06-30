class Customer < ActiveRecord::Base
	belongs_to :district, class_name: 'Category', foreign_key: 'district_id'
	# delegate :name, to: :district, prefix: true 

	belongs_to :community, class_name: 'Category', foreign_key: 'community_id'
  # delegate :name, to: :community, prefix: true 

	belongs_to :building, class_name: 'Category', foreign_key: 'building_id'
	# delegate :name, to: :building, prefix: true

	belongs_to :heating_status, class_name: 'HeatingStatus', foreign_key: 'heating_status_id'
	# delegate :name, to: :heating_status, prefix: true

end
