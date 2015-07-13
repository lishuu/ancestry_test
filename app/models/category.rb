class Category < ActiveRecord::Base
	has_ancestry
	validates :name, presence: true, length: { minimum: 3}

	def open
		return [0,1,2].include?(nodetype)
	end

	def attributes
		super.merge({'open' => open})
	end
end
