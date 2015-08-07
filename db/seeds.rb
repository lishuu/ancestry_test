# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# bj = Category.create( name: "宝鸡热力" )

# ds_daqing, ds_zhongshan, ds_qiaonan = bj.children.create( [{name: "大庆路片区"}, {name: "中山路片区"}, {name: "桥南片区"}] )

# ds_daqing.children.create([
# 	{name: "叉车五厂10号院"}, {name: "叉车五厂49号院"}, {name: "叉车五厂68号院"}, {name: "工农村"}, 
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

heating_status = ["正常供热", "停止供热", "未知"]
heating_status.each{ |d| HeatingStatus.where(:name => d).first_or_create}
