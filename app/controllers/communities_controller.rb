class CommunitiesController < ApplicationController

  def index
  end

  def new
    @Category = Category.new
  end

  def show
  	@Category = Category.find(params[:id])
  end



end
