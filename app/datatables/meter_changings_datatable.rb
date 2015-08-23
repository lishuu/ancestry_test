class MeterChangingsDatatable
	delegate :params, :link_to, :fa_icon, :edit_code_meter_changing_path, to: :@view

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
    		c.id, 
        c.team.name,
        c.worker,
        c.work_date,
        c.past_no,
        c.past_val,
        c.current_no,
        c.current_val,
        c.remark,
        link_to( fa_icon('pencil-square-o'), edit_meter_changing_path(c), remote: true, class: "btn btn-xs btn-primary" ),
        link_to( fa_icon('trash-o'), c, method: :delete, remote: true, data: { confirm: "您确定删除当前数据吗？" }, class: "btn btn-xs btn-danger" )
    	]
    end	
  end

  def mydatas
    @mydatas ||= fetch_datas	
  end

  def fetch_datas
  	meterchangings = MeterChanging.where( @c ).order("#{sort_column} #{sort_direction}")
    meterchangings = meterchangings.page(page).per_page(per_page)
    if params[:sSearch].present?
    	meterchangings = meterchangings.where("worker like :search or hv like :search", search: "%#{params[:sSearch]}%" )
    end
    meterchangings    	
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
  	params[:iDisplayLenght].to_i >0 ? params[:iDisplayLenght].to_i : 10
  end

   def sort_column
     columns = %w[id work_date]
     columns[params[:iSortCol_0].to_i]
   end

  def sort_direction
    params[:sSortDir_0]	== "desc" ? "desc" : "asc"
  end

end