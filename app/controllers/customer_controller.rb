class CustomerController < ApplicationController

  def index
    cd = params[:cd]
    cc = params[:cc]
    cb = params[:cb]

    puts "片区ID:#{cd}"
    puts "小区ID:#{cc}"
    puts "楼宇ID:#{cb}"



  	respond_to do |format|
  	  format.html
      format.json { render json: CustomerDatatable.new(view_context, {community_id: cc, district_id: cd} ) }
  	end
  end

  # def datatable_ajax
  # 	render json: CustomerDatatable.new(view_content)
  # end

  def show
    @customer = Customer.find(params[:id])	
  end

end
