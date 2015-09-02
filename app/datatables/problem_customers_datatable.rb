class ProblemCustomersDatatable
	delegate :params,:link_to,:fa_icon,:edit_problem_customer_path, to: :@view

	def initialize(view, param)
    @view = view
    @param = param		
	end

	def as_json(options = {})
		{
      sEcho: params[:sEcho].to_i,
      iTotalRecords: mydatas.count,
      iTotalDisplayRecords: mydatas.total_entries,
      aaData: data
		}
	end

private

  def data
  	mydatas.map do |c|
  		[
  			# c.id,
        c.workorder_no,
  			c.meter_brand.name,
  			c.past_meterno,
  			c.changing_meterno,
  			# c.past_basenum,
  			# c.past_val,
  			c.current_basenum,
  			c.current_val,
  			c.team.name,
  			c.code_troubleshooting.name,
  			c.code_troubleshooting.shooting,
  			# c.workorder_no,
        link_to( fa_icon('pencil-square-o'), edit_problem_customer_path(c), remote: true, class: "btn btn-xs btn-primary" ),
        link_to( fa_icon('trash-o'), c, method: :delete, remote: true, data: { confirm: "您确定删除当前数据吗？" }, class: "btn btn-xs btn-danger" )
  		]
  	end
  end

  def mydatas
    @mydatas ||= fetch_datas	
  end

  def fetch_datas
  	pcustomers = ProblemCustomer.includes(:team, :code_troubleshooting, :meter_brand ).where(@param).order("#{sort_column} #{sort_direction}")
    pcustomers = pcustomers.page(page).per_page(per_page)
    if params[:sSearch].present?
    	pcustomers = pcustomers.where("past_meterno like :search or changing_meterno like :search", search: "%#{params[:sSearch]}%" )
    end
    pcustomers    	
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
  	params[:iDisplayLenght].to_i >0 ? params[:iDisplayLenght].to_i : 10
  end

   def sort_column
     columns = %w[id]
     columns[params[:iSortCol_0].to_i]
   end

  def sort_direction
    params[:sSortDir_0]	== "desc" ? "desc" : "asc"
  end  

end