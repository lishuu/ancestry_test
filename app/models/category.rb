class Category < ActiveRecord::Base
	has_ancestry

	def open
		return [0,1,2].include?(nodetype)
	end

	def attributes
		super.merge({'open' => open})
	end
end
