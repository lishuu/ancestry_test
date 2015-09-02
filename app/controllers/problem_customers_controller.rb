class ProblemCustomersController < ApplicationController

	before_action :set_problem_customer, only: [:show, :edit, :update, :destroy]
	
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

	def create
		@customer = Customer.find(session[:current_customer_id])
	  @problem_customer = @customer.problem_customers.build(problem_customer_params)
	  respond_to do |format|
	  	if @problem_customer.save
	  		flash.now[:notice] = "数据保存成功！"
	  		format.json {head :no_content}
	  		format.js
	  	else
	  		format.json {render json: @problem_customer.errors.full_messages, status: :unprocessable_entity}
	  	end
	  end
	end

	def edit
	end

	def update
	  respond_to do |format|
	  	if @problem_customer.update(problem_customer_params)
	  		flash.now[:notice] = "数据更新成功！"
	  		format.json { head :no_content }
	  		format.js
	  	else
	  		flash.now[:error] = "数据更新失败！"
	  		format.json {render json: @problem_customer.errors.full_messages, status: :upprocessable_entity }
	  	end
	  end
	end

	def destroy
	  flash.now[:notice] = "记录删除成功！" if @problem_customer.destroy
	  respond_to do |format|
	  	format.js
	  end
	end

private

  def problem_customer_params
    params.require(:problem_customer).permit(:work_order, :customer_id, :meter_brand_id, :past_meterno, :changing_meterno, 
    	:past_basenum, :past_val, :current_basenum, :current_val, :team_id, :troubleshooting_id, :analysis, :solving )
  end

  def set_problem_customer
  	@problem_customer = ProblemCustomer.find(params[:id])
  end

end