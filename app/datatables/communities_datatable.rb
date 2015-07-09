class CommunitiesDatatable
	delegate :params, :h, :link_to, to: :@view

	def initialize(view, param)
		@view = view
		@param = param
    puts @param[:id]
	end

	def as_json(ooptins = {})
		{
			sEcho: params[:sEcho].to_i,
			iTotalRecords: Category.count,
			iTotalDisplayRecords: mydatas.total_entries,
			aaData: data
		}
	end

private
  def data
  	mydatas.map do |c|
  		[
        c.id,
  			c.name,
  			c.code,
        link_to('编辑', '#', class: "btn btn-xs btn-primary" ) + link_to('删除', '#', class: "btn btn-xs btn-danger")
  		]
  	end
  end

  def mydatas
  	@mydatas ||= fetch_datas
  end

  def fetch_datas
    # mydatas = Category.find(1).children
    mydatas = Category.find( @param[:id] ).children
    mydatas = mydatas.order("#{sort_column} #{sort_direction}")
    mydatas = mydatas.page(page).per_page(per_page)
   	if params[:sSearch].present?
  		mydatas = mydatas.where("name like :search", search: "%#{params[:sSearch]}%")
  	end
  	mydatas   
  end 

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
  	params[:iDisplayLenght].to_i >0 ? params[:iDisplayLenght].to_i : 10
  end

   def sort_column
     columns = %w[name code]
     columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0]	== "desc" ? "desc" : "asc"
  end  


end