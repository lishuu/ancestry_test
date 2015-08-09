# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# bj = Category.create( name: "宝鸡热力" )

# ds_daqing, ds_zhongshan, ds_qiaonan = bj.children.create( [{name: "大庆路片区"}, {name: "中山路片区"}, {name: "桥南片区"}] )

# ds_daqing.children.create([# 	{name: "叉车五厂10号院"}, {name: "叉车五厂49号院"}, {name: "叉车五厂68号院"}, {name: "工农村"}, 

# 	{name: "果品公司家属楼"}, {name: "恒源小区"}, {name: "金台联社"}, {name: "经纬花园"},
# 	{name: "秦岭泊屋"}, {name: "新华村"}, {name: "西建康城"}, 
# 	{name: "新秦造纸"}, {name: "油毡厂小区"}
# 	])

# ds_zhongshan.children.create([

#   {name: "宝运花园41南区"}, {name: "中山西路长寿联社"}, {name: "复新村"}, {name: "金陵湾"}, 
#   {name: "立新巷"}, {name: "市二建"}, {name: "瓦厂街129号楼"}, {name: "新华园"}, 
#   {name: "中山西路"}

# 	])

# ds_qiaonan.children.create([

#   {name: "五金公司"}, {name: "秀水居"}
# 	])

#  初始化热力公司管理片区属性结构
puts "准备开始初始化数据..."
if Category.count < 1
	bj = Category.where(:name => "某热力公司").first_or_create
	# unless bj.nil?
	# 	bj.children.create( [ {name: "姜谭", nodetype:1, code:"JT"}, 
	# 											  {name: "大庆", nodetype:1, code:"DQ"}, 
	# 											  {name: "桥南", nodetype:1, code:"QN"}, 
	# 											  {name: "宝十", nodetype:1, code:"BS"}, 
	# 											  {name: "渭工", nodetype:1, code:"WG"}, 
	# 											  {name: "金陵", nodetype:1, code:"JL"}, 
	# 											  {name: "高新", nodetype:1, code:"GX"}, 
	# 											  {name: "马营", nodetype:1, code:"MY"}
	# 											 ] )
	# end

	# buildings = JSON.parse(File.read(File.join(Rails.root, 'public', 'buildings.csv')))
	require 'open-uri'
	require 'csv'
	url = File.join(Rails.root, 'public', 'buildings.csv')
	url_data = open(url).read()
	CSV.parse(url_data).each do |row|
		id, name, bz, order_num, d_id, code, d_name = row
		puts "#{id}, #{name}, #{code}, #{d_id}, #{d_name}" 
	end
end



heating_status = ["正常供热", "停止供热", "未知"]
heating_status.each{ |d| HeatingStatus.where(:name => d).first_or_create}

heating_types = ["居民", "非居民"]
heating_types.each{ |d| HeatingType.where(:name => d).first_or_create}

customer_types = ["按计量收费", "按面积收费", "计量空转"]
CustomerType.where(:name => customer_types[0]).first_or_create(:order_num => 1)
CustomerType.where(:name => customer_types[1]).first_or_create(:order_num => 2)
CustomerType.where(:name => customer_types[2]).first_or_create(:order_num => 3)

charging_areas = ["金陵区域", "姜谭区域", "马营区域", "大庆区域", "高新区域", "桥南区域", "群众、宝十区域", "渭工区域"]
charging_areas.each {|d| ChargingArea.where(:name=>d).first_or_create}
