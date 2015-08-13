class HeatingStation < ActiveRecord::Base
	belongs_to :district, class_name: 'Category' , foreign_key: 'district_id'
	belongs_to :charging_area, class_name: 'ChargingArea', foreign_key: 'charging_area_id'
end
