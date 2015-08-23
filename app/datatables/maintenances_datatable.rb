class MaintenancesDatatable
	delegate :params, :link_to, :fa_icon, :edit_maintenance_path, to: :@view

	def initialize(view, param)
		@view = view
		@c = param
	end

	def as_json(ooptins = {})
		{
			sEcho: params[:sEcho].to_i,
			iTotalRecords: maintenances.count, # Maintenance.count, 将不显示 "(由 72 项结果过滤)" ，72 is Model.count
			iTotalDisplayRecords: maintenances.total_entries, 
			aaData: data
		}
	end

private

  def data
  	maintenances.map do |c|
  		[
  			c.id,
  			c.team.name,
  			c.worker,
  			c.work_date,
  			c.meter_status.name,
  			c.hv,
  			c.remark,
        link_to( fa_icon('pencil-square-o'), edit_maintenance_path(c), remote: true, class: "btn btn-xs btn-primary" ),
        link_to( fa_icon('trash-o'), c, method: :delete, remote: true, data: { confirm: "您确定删除当前数据吗？" }, class: "btn btn-xs btn-danger" )
  		]
  	end
  end

  def maintenances
  	@maintenances ||= fetch_maintenances
  end

  def fetch_maintenances
  	maintenances = Maintenance.where( @c ).order("#{sort_column} #{sort_direction}")
    maintenances = maintenances.page(page).per_page(per_page)
    if params[:sSearch].present?
    	maintenances = maintenances.where("worker like :search or hv like :search", search: "%#{params[:sSearch]}%" )
    end
    maintenances
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