# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#  初始化热力公司管理片区属性结构
require 'open-uri'
require 'csv'

puts "准备开始初始化数据..."
if Category.count < 1
	@bj = Category.create!( name: "某热力公司", nodetype:0 )
	@dis_jt, @dis_dq, @dis_qn, @dis_bs, @dis_wg, @dis_jl, @dis_gx, @dis_my = 
		@bj.children.create!( [ {name: "姜谭", nodetype:1, code:"JT"}, 
												  {name: "大庆", nodetype:1, code:"DQ"}, 
												  {name: "桥南", nodetype:1, code:"QN"}, 
												  {name: "宝十", nodetype:1, code:"BS"}, 
												  {name: "渭工", nodetype:1, code:"WG"}, 
												  {name: "金陵", nodetype:1, code:"JL"}, 
												  {name: "高新", nodetype:1, code:"GX"}, 
												  {name: "马营", nodetype:1, code:"MY"}
												 ] )

	
	puts "开始初始化小区信息..."
	url = File.join(Rails.root, 'public', 'buildings.csv')
	url_data = open(url).read()
	CSV.parse(url_data).each do |row|
		id, name, remark, order_num, d_id, code, d_name = row

	  if d_name=="姜谭" && d_id.to_i == 1
	  	@dis_jt.children.create!( {name: name, nodetype: 2, code: code} )
	  elsif d_name=="大庆" && d_id.to_i == 2
	  	@dis_dq.children.create!( {name: name, nodetype: 2, code: code} )
	  elsif d_name=="桥南" && d_id.to_i == 3
	  	@dis_qn.children.create!( {name: name, nodetype: 2, code: code} )
	  elsif d_name=="宝十" && d_id.to_i == 4
	  	@dis_bs.children.create!( {name: name, nodetype: 2, code: code} )
	  elsif d_name=="渭工" && d_id.to_i == 5
	  	@dis_wg.children.create!( {name: name, nodetype: 2, code: code} )
	  elsif d_name=="金陵" && d_id.to_i == 6
	  	@dis_jl.children.create!( {name: name, nodetype: 2, code: code} )
	  elsif d_name=="高新" && d_id.to_i == 7
	  	@dis_gx.children.create!( {name: name, nodetype: 2, code: code} )
	  elsif d_name=="马营" && d_id.to_i == 8
	  	@dis_my.children.create!( {name: name, nodetype: 2, code: code} )
	  end
	end

  puts "开始初始化楼宇信息..."
	url = File.join(Rails.root, 'public', 'CSXTD.csv')
	url_data = open(url).read()
	CSV.parse(url_data).each do |row|
    district_name, district_id, community_name, community_id, building_no = row
    puts "当前处理小区：#{community_name} ..."
    # @community = Category.where(:name=>community_name).take
    @community = Category.find_by! name: community_name
    @community.children.create!( {name: building_no, nodetype: 3} )
	end

end


if MeterStatus.count < 1
	puts "初始化表具运行状态信息..."
	url = File.join(Rails.root, 'public', 'meter_status.csv')
	url_data = open(url).read()
	CSV.parse(url_data).each do |row|
    id,name,remark,order_num = row
    MeterStatus.create!(name: name, remark: remark, order_num: order_num.to_i)
	end
end

if Team.count < 1 
	puts "初始化表具品牌信息..."
	teams = ["宝鸡热力客服", "惠众（热力）", "立邦电子（汇中）", "伟岸", "天罡", "誉达电子（瑞纳）"]
	teams.each{ |d| Team.where(:name => d).first_or_create}
end

if MeterBrand.count < 1
	meter_brands = ["海威茨", "伟岸", "汇中", "瑞纳", "迈拓", "力创", "天罡", "三龙", "未知"]
	meter_brands.each { |d| MeterBrand.where(:name => d).first_or_create }
end

metering_types = ["远传抄表", "人工抄表"]
metering_types.each{ |d| MeteringType.where(:name=>d).first_or_create}

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

if HeatingStation.count < 1 
  p "初始化换热站信息..."
  url = File.join(Rails.root, 'public', 'heating_station.csv') 
  url_data = open(url).read()
  CSV.parse(url_data).each do |row|
    id,name,district_id,charging_area_id,charging_area,district_name = row
    @district = Category.where(:name => district_name).take
    @charging_area = ChargingArea.where(:name => charging_area).take
    @district.heating_stations.create!(name: name, charging_area_id: @charging_area.id)
  end
end

if TroubleType.count < 1
	p "初始化故障类别信息..."
	trouble_types = ["客户服务", "现场运维"]
  trouble_types.each { |d| TroubleType.where(:name=>d).first_or_create}	
end

p "===================== 恭喜！数据初始化完毕！ ========================"
