class CommunitiesController < ApplicationController

  def index

  end

  def show
  	@Category = Category.find(params[:id])
  end

  def load
    current_id = params[:cid]

    data_filters = {} 	
    data_filters[:id] = current_id if current_id
    puts '当前节点ID：' + current_id

    respond_to do |format|
    	format.html
    	format.json { render json: CommunitiesDatatable.new( view_context, data_filters) }
    end
  end

end
