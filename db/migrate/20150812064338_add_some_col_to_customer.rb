class AddSomeColToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :room_old_code, :string # 房间编码(老数据)
    add_column :customers, :is_metering, :boolean  # 是否热计量
    add_column :customers, :customer_type_id, :integer # 用户类型
    add_column :customers, :metering_type_id, :integer # 抄表方式
    add_column :customers, :meter_status_id, :integer # 表具运行状态
    add_column :customers, :heating_type_id, :integer # 供暖类型
    add_column :customers, :heating_area, :float # 供热面积
    add_column :customers, :charging_area_id, :integer # 网所信息
    add_column :customers, :heating_station_id, :integer # 换热站信息
    add_column :customers, :meter_base_num, :float # 表具底数
    add_column :customers, :hv_current, :float # 当前用热量
    add_column :customers, :hv_last, :float # 上个供暖季用热量
    add_column :customers, :hv_last2, :float # 上上个供暖季用热量
  end
end
