class CustomersDatatable
	delegate :params, :h, :link_to, :fa_icon, :edit_customer_path, to: :@view

	def initialize(view, param1)
		@view = view
    @c = param1
	end

	def as_json(ooptins = {})
		{
			sEcho: params[:sEcho].to_i,
			iTotalRecords: Customer.count,
			iTotalDisplayRecords: customers.total_entries,
			aaData: data
		}
	end

private
  
  def data
  	customers.map do |c|
  		[
        c.id, 
  			link_to(c.name, c, target: '_blank'),
  			c.meter_no,
  			c.building_name,
  			c.unit,
  			c.floor,
  			c.room,
  			c.heating_status_name,
        link_to( fa_icon('pencil-square-o'), edit_customer_path(c), remote: true, class: "btn btn-xs btn-primary" ),
        link_to( fa_icon('trash-o'), c, method: :delete, remote: true, data: { confirm: "您确定删除当前数据吗？" }, class: "btn btn-xs btn-danger" )
  		]
  	end
  end

  def customers
    @customers ||= fetch_customers	
  end

  def fetch_customers
  	# customers = Customer.where( @c ).order("#{sort_column} #{sort_direction}")
    customers = Customer.joins(:heating_status, 
      'left outer join categories as d on customers.district_id = d.id',
      'left outer join categories as c on customers.community_id = c.id',
      'left outer join categories as b on customers.building_id = b.id')
    .select('customers.*, heating_statuses.name as heating_status_name, d.name as district_name, c.name as community_name, b.name as building_name')
    .where( @c ).order("#{sort_column} #{sort_direction}")
  	customers = customers.page(page).per_page(per_page)
  	if params[:sSearch].present?
  		customers = customers.where("customers.name like :search or customers.room like :search or customers.meter_no like :search", search: "%#{params[:sSearch]}%")
  	end
  	customers
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
  	params[:iDisplayLenght].to_i >0 ? params[:iDisplayLenght].to_i : 10
  end

  # def sort_column
  #   columns = %w[name meter_no district_name community_name building_name unit floor room heating_status_name address]	
  #   columns[params[:iSortCol_0].to_i]
  # end

   def sort_column
     columns = %w[name meter_no district_name community_name building_name unit floor room heating_status_name address ]
     columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0]	== "desc" ? "desc" : "asc"
  end

end