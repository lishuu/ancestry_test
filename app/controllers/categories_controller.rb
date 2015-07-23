class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
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
        flash.now[:notice] = "数据新建成功！"
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
        flash.now[:notice] = "数据更新成功！"
        format.json { head :no_content }
        format.js
      else
        flash.now[:error] = "数据更新失败！"
        format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@category = Category.find(params[:id])
  end

  def destroy
    if @category.has_children?
      flash.now[:warning] = "当前记录已存在子记录，无法删除！"
    else
      flash.now[:notice] = "记录删除成功！" if @category.destroy
    end
    respond_to do |format|
      format.js
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
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