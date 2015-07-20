class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destory]
  # skip_before_filter :verify_authenticity_token, only: [:submit]

	def index
		# @category = Category.all
	end

	def new
    @category = Category.new
  end

  def create 
  	@ParentNode = Category.find(params[:pnode])
  	@category = @ParentNode.children.create( category_params )
    @category.nodetype = params[:nodetype]

    respond_to do |format|
      if @category.save
        format.json { head :no_content}
        format.js
      else
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@category = Category.find(params[:id])
  end

	def customerlists
	end

	def tree_full
		@category = Category.all
		respond_to do |format|
  		format.html # index.html.erb
  		format.xml  { render :xml => @category }
			format.json { render :json => @category.arrange_serializable }
		end
	end

	def load
    current_id = params[:cid]

    data_filters = {} 	
    data_filters[:id] = current_id if current_id

    respond_to do |format|
    	format.html
    	format.json { render json: CommunitiesDatatable.new( view_context, data_filters ) }
    end
  end

private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :code, :nodetype)
  end

end