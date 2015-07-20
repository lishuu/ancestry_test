class CommunitiesDatatable
	delegate :params, :h, :link_to, :fa_icon, :edit_category_path, to: :@view

	def initialize(view, param)
		@view = view
		@param = param
    puts "当前节点ID：#{param}"
	end

	def as_json(ooptins = {})
		{
			sEcho: params[:sEcho].to_i,
			iTotalRecords: mydatas.count,
			iTotalDisplayRecords: mydatas.total_entries,
			aaData: data
		}
	end

private

  def data
    puts "datatables 记录数: #{mydatas.count}"
  	mydatas.map do |record|
  		[
        record.id,
  			record.name,
  			record.code,
        link_to( fa_icon('pencil-square-o'), edit_category_path(record), remote: true, class: "btn btn-xs btn-primary" ),
        link_to( fa_icon('trash-o'), '#', class: "btn btn-xs btn-danger")

  		]
  	end
  end

  def mydatas
  	@mydatas ||= fetch_datas
  end

  def fetch_datas
    mydatas = Category.find( @param[:id] ).children
    mydatas = mydatas.order("#{sort_column} #{sort_direction}")
    mydatas = mydatas.page(page).per_page(per_page)
   	if params[:sSearch].present?
  		mydatas = mydatas.where("name like :search or code like :search ", search: "%#{params[:sSearch]}%")
  	end
    puts mydatas
    puts "mydatas.count = #{mydatas.count}"
  	mydatas   
  end 

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

   def sort_column
     columns = %w[name code]
     columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0]	== "desc" ? "desc" : "asc"
  end  

end