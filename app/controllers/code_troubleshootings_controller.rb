class CodeTroubleshootingsController < ApplicationController
  before_action :set_code_troubleshooting, only: [:show, :edit, :update, :destroy]
  before_action :set_trouble_type, only: [:datatable_ajax]

  # GET /code_troubleshootings
  # GET /code_troubleshootings.json
  def index

  end

  def datatable_ajax
    render json: CodeTroubleshootingsDatatable.new( view_context, {trouble_type: @trouble_type}) 
  end

  # GET /code_troubleshootings/1
  # GET /code_troubleshootings/1.json
  def show
  end

  # GET /code_troubleshootings/new
  def new
    @code_troubleshooting = CodeTroubleshooting.new
  end

  # GET /code_troubleshootings/1/edit
  def edit
  end

  # POST /code_troubleshootings
  # POST /code_troubleshootings.json
  def create
    # @code_troubleshooting = CodeTroubleshooting.new(code_troubleshooting_params)
    @troubleshooting_type = TroubleType.find( params[:troubletypeid])
    puts @troubleshooting_type.name
    # @code_troubleshooting.trouble_type_id = params[:troubletype_id]
    @code_troubleshooting = @troubleshooting_type.code_troubleshootings.create( code_troubleshooting_params )

    respond_to do |format|
      if @code_troubleshooting.save
        flash.now[:notice] = "数据新建成功！"
        format.json { head :no_content}
        format.js
      else
        format.json { render json: @code_troubleshooting.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /code_troubleshootings/1
  # PATCH/PUT /code_troubleshootings/1.json
  def update
    respond_to do |format|
      if @code_troubleshooting.update(code_troubleshooting_params)
        flash.now[:notice] = "数据更新成功！"
        format.json { head :no_content }
        format.js
      else
        flash.now[:error] = "数据更新失败！"
        format.json { render json: @code_troubleshooting.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /code_troubleshootings/1
  # DELETE /code_troubleshootings/1.json
  def destroy
    flash.now[:notice] = "记录删除成功！" if @code_troubleshooting.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to code_troubleshootings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code_troubleshooting
      @code_troubleshooting = CodeTroubleshooting.find(params[:id])
    end

    def set_trouble_type
      @trouble_type = TroubleType.find(params[:ttid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_troubleshooting_params
      params.require(:code_troubleshooting).permit(:name, :code, :trouble_type_id, :shooting, :order_num)
    end
end
