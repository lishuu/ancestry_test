class MeterChangingsController < ApplicationController

	def index
	end

	def new
	end

	def datatable_ajax
	  customerid = params[:customerid]	
	  meterchanging_filters = {}
	  meterchanging_filters[:customer_id] = customerid if customerid
    respond_to do |format|
    	format.json { render json: MeterChangingsDatatable.new( view_context, meterchanging_filters )}
    end	  	
	end

end