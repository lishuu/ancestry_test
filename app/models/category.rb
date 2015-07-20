class Category < ActiveRecord::Base
	has_ancestry
	validates :name, presence: true, length: { minimum: 3}
  validates :name, uniqueness: {scope: :ancestry, message: "名称重复，请确定您的输入！"}	
  validates :code, uniqueness: {scope: :ancestry}

	def open
		return [0,1,2].include?(nodetype)
	end

	def attributes
		super.merge({'open' => open})
	end
end
