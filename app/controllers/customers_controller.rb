class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

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
    # session[:current_customer_id] = @customer.id 
    render :layout => false
  end

  def new
    @customer = Customer.new
    @heating_stations = HeatingStation.where(:district_id=>params[:district_id])
  end

  def create
    @customer = Customer.create(customer_params) 
    respond_to do |format|
      if @customer.save
        flash.now[:notice] = "数据新建成功！"
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @customer.errors.full_messages, status: :unprocessable_entity }
      end
    end 
  end

  def edit
    @heating_stations = HeatingStation.where(:district_id=>@customer.district_id)
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        flash.now[:notice] = "数据更新成功！"
        format.json { head :no_content}
        format.js
      else
        flash.now[:error] = "数据更新失败！"
        format.json { render json: @customer.errors.full_messages, status: :unprocessable_entity}
      end
    end 
  end

  def destroy
    flash.now[:notice] = "记录删除成功！" if @customer.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to customer_url }
      format.json { head :no_content }
    end
  end

private
  
  def customer_params
     params.require(:customer).permit(:name, :meter_no, :district_id, :community_id, :building_id, :unit, :floor, :room, :heating_status_id, :address,
      :room_old_code, :is_metering, :customer_type_id, :metering_type_id, :meter_status_id, :heating_type_id, :heating_area, :charging_area_id, :heating_station_id,
      :meter_base_num, :hv_current, :hv_last, :hv_last2)
  end

  def set_customer
    @customer = Customer.find(params[:id]) 
  end

end
