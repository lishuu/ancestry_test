class CategoryController < ApplicationController

	def index
		# @category = Category.all
	end

	def tree_full
		@category = Category.all
		respond_to do |format|
  		format.html # index.html.erb
  		format.xml  { render :xml => @category }
			format.json { render :json => @category.arrange_serializable }
		end
	end

	# def main 
 #  	root_id = params[:cid]

 #    data_filters = {} 	
 #    data_filters[:id] = root_id if root_id
 #    puts '当前节点ID：#{root_id}'

 #    respond_to do |format|
 #    	format.html
 #    	format.json { render json: CommunitiesDatatable.new( view_context, data_filters) }
 #    end
	# end

	# def tree_d
	# 	@category = Category.
	# end

end