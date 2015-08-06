class CodeTroubleshootingsDatatable
	delegate :params, :link_to, :fa_icon, :edit_code_troubleshooting_path, to: :@view

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
  	mydatas.map do |record|
  		[
  			record.id,
  			record.name,
  			record.code,
        record.shooting,
  			record.order_num,
        link_to( fa_icon('pencil-square-o'), edit_code_troubleshooting_path(record), remote: true, class: "btn btn-xs btn-primary" ),
        link_to( fa_icon('trash-o'), record, method: :delete, remote: true, data: { confirm: "您确定删除当前数据吗？" }, class: "btn btn-xs btn-danger" )
  		]
  	end
  end

  def mydatas
  	@mydatas ||= fetch_datas
  end

  def fetch_datas
  	mydatas = CodeTroubleshooting.where( trouble_type_id: @param[:trouble_type].id )
  	mydatas = mydatas.order("#{sort_column} #{sort_direction}")
    mydatas = mydatas.page(page).per_page(per_page)
   	if params[:sSearch].present?
  		mydatas = mydatas.where("name like :search or code like :search ", search: "%#{params[:sSearch]}%")
  	end
  	mydatas  	
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
     columns = %w[id name code shooting order_num]
     columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0]	== "desc" ? "desc" : "asc"
  end 

end