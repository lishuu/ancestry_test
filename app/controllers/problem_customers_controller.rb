class ProblemCustomersController < ApplicationController
	def index
	end

	def datatable_ajax
	  customerid = params[:customerid]	
	  pc_filters = {}
	  pc_filters[:customer_id] = customerid if customerid
	  respond_to do |format|
	  	format.json{render json: ProblemCustomersDatatable.new(view_context, pc_filters)}
	  end
	end

	def new
	  session[:current_customer_id]	 = params[:id]
	  @problem_customer = ProblemCustomer.new
	  @customer = Customer.find(session[:current_customer_id])
	  @problem_customer.past_meterno = @customer.meter_no
	  @problem_customer.past_val = @customer.hv_current
	end

end