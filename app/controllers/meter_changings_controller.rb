class MeterChangingsController < ApplicationController

  before_action :set_meter_changing, only: [:show, :edit, :update, :destroy]

	def index
	end

	def new
		session[:current_customer_id] = params[:id]
		@meter_changing = MeterChanging.new
	  @customer = Customer.find( session[:current_customer_id] )	
		@meter_changing.past_no = @customer.meter_no
		@meter_changing.past_val = @customer.hv_current
	end

	def datatable_ajax
	  customerid = params[:customerid]	
	  meterchanging_filters = {}
	  meterchanging_filters[:customer_id] = customerid if customerid
    respond_to do |format|
    	format.json { render json: MeterChangingsDatatable.new( view_context, meterchanging_filters )}
    end	  	
	end

	def create
	  @customer = Customer.find( session[:current_customer_id] )	
	  @meter_changing = @customer.meter_changings.build( meter_changing_params )
	  respond_to do |format|
	  	if @meter_changing.save
	  		flash.now[:notice] = "数据更新成功！"
	  		format.json { head :no_content }
	  		format.js
	  	else
	  		format.json { render json: @meter_changing.errors.full_messages, status: :unprocessable_entity}
	  	end
	  end
	end

	def edit
		
	end

	def update
	  respond_to do |format| 
	  	if @meter_changing.update(meter_changing_params)
        flash.now[:notice] = "数据更新成功！"
        format.json { head :no_content}
        format.js
	  	else
	  		flash.now[:error] = "数据更新失败！"
	  		format.json {render json: @meter_changing.errors.full_messages, status: :unprocessable_entity }
	  	end
	  end	
	end

	def destroy
    flash.now[:notice] = "记录删除成功！" if @meter_changing.destroy
    respond_to do |format|
    	format.js
    end
	end

private

  def meter_changing_params
    params.require(:meter_changing).permit(:customer_id, :team_id, :worker, :work_date, :past_no, :past_val, :current_no, :current_val, :remark, :is_sync)
  end

  def set_meter_changing
  	@meter_changing = MeterChanging.find(params[:id])
  end

end