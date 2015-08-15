class MeterStatusesController < ApplicationController
  before_action :set_meter_status, only: [:show, :edit, :update, :destroy]
	def index
		@meter_statuses = MeterStatus.order(:order_num).all
	end

  def show
  end

  def new 
  	@meter_status = MeterStatus.new
  end	

  def create
    @meter_status = MeterStatus.create(meter_status_params)

    respond_to do |format|
      if @meter_status.save
        flash.now[:notice] = "数据新建成功！"
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @meter_status.errors.full_messages, status: :unprocessable_entity }
      end
      
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @meter_status.update(meter_status_params)
        flash.now[:notice] = "数据更新成功！"
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @meter_status.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # 如果已被引用则无法删除尚未完成
  def destroy
    flash.now[:notice] = "记录删除成功！" if @meter_status.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to meter_status_url }
      format.json { head :no_content }
    end
  end

private

  def meter_status_params
    params.require(:meter_status).permit(:name, :remark, :order_num)
  end

  def set_meter_status
    @meter_status = MeterStatus.find(params[:id])
  end

  
end