class CustomersController < ApplicationController

  def index
    cd = params[:cd]
    cc = params[:cc]
    cb = params[:cb]

   customer_filters = {}
   customer_filters[:district_id] = cd if cd 
   customer_filters[:community_id] = cc if cc
   customer_filters[:building_id] = cb if cb

   # puts customer_filters

  	respond_to do |format|
  	  format.html
      format.json { render json: CustomersDatatable.new( view_context, customer_filters ) }
  	end
  end

  # def datatable_ajax
  # 	render json: CustomerDatatable.new(view_content)
  # end

  def show
    @customer = Customer.find(params[:id])	
  end

end
