class Customer < ActiveRecord::Base

  validates :name, presence: true

	belongs_to :district, class_name: 'Category', foreign_key: 'district_id'
	# delegate :name, to: :district, prefix: true 
	belongs_to :community, class_name: 'Category', foreign_key: 'community_id'
  # delegate :name, to: :community, prefix: true 
	belongs_to :building, class_name: 'Category', foreign_key: 'building_id'
	# delegate :name, to: :building, prefix: true
	belongs_to :heating_status, class_name: 'HeatingStatus', foreign_key: 'heating_status_id' #供热状态
	# delegate :name, to: :heating_status, prefix: true
  belongs_to :customer_type, class_name:'CustomerType', foreign_key: 'customer_type_id' #用户类型
  #
  belongs_to :metering_type, class_name: 'MeteringType', foreign_key: 'metering_type_id' # 抄表方式

  belongs_to :meter_status, class_name: 'MeterStatus', foreign_key: 'meter_status_id' # 表具运行状态

  belongs_to :heating_type, class_name: 'HeatingType', foreign_key: 'heating_type_id' # 供暖类型

  belongs_to :charging_area, class_name: 'ChargingArea', foreign_key: 'charging_area_id' #网所信息

  belongs_to :heating_station, class_name: 'HeatingStation', foreign_key: 'heating_station_id' #换热站信息

  has_many :maintenances
  has_many :meter_changings
  has_many :problem_customers
end
