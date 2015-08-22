class MaintenancesController < ApplicationController
	# before_action :set_customer, only: [:new]
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

	def index
	end

	def datatable_ajax
	  customerid = params[:customerid]	
	  maintenance_filters = {}
	  maintenance_filters[:customer_id] = customerid if customerid
    respond_to do |format|
    	format.json { render json: MaintenancesDatatable.new( view_context, maintenance_filters )}
    end
	end

	def new
    session[:current_customer_id] = params[:id] 
	  @maintenance = Maintenance.new	
	end

	def create
    @customer = Customer.find( session[:current_customer_id] )
    @maintenance = @customer.maintenances.build(maintenance_params)
    respond_to do |format|
    	if @maintenance.save
    		flash.now[:notice] = "数据新建成功！"
    		format.json { head :no_content }
    		format.js
    	else
    		format.json {render json: @maintenance.errors.full_messages, status: :unprocessable_entity}
    	end
    end
	end

  def destroy
    flash.now[:notice] = "记录删除成功！" if @maintenance.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        flash.now[:notice] = "数据更新成功！"
        format.json { head :no_content}
        format.js
      else
        flash.now[:error] = "数据更新失败！"
        format.json {render json: @maintenance.errors.full_messages, status: :unprocessable_entity}
      end
    end 
  end

private
  def maintenance_params
    params.require(:maintenance).permit(:custmer_id, :team_id, :worker, :work_date, :meter_status_id, :hv, :remark, :is_sync)
  end

  def set_maintenance
  	@maintenance = Maintenance.find(params[:id])
  end

end