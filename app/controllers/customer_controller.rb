class CustomerController < ApplicationController

  def index
  	respond_to do |format|
  	  format.html
  	  format.json { render json: CustomerDatatable.new(view_context)}	
  	end
  end

  # def datatable_ajax
  # 	render json: CustomerDatatable.new(view_content)
  # end

  def show
    @customer = Customer.find(params[:id])	
  end

end
