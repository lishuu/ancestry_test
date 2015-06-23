class CategoryController < ApplicationController
	def index
		@category = Category.all
	end

	def tree_data
		@category = Category.all
		respond_to do |format|
  		format.html # index.html.erb
  		format.xml  { render :xml => @category }
			format.json { render :json => @category.arrange_serializable }
		end
	end

end