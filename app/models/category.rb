class Category < ActiveRecord::Base
	has_ancestry
	validates :name, presence: true
	has_many :heating_stations, :foreign_key => "district_id"
  # validates :name, uniqueness: {scope: :ancestry, message: "重复，请确定您的输入！"}	
  # validates :code, uniqueness: {scope: :ancestry, message: "重复，请确定您的输入！"}

	def open
		return [0,1].include?(nodetype) 
	end

	def attributes
		super.merge({'open' => open})
	end
end
