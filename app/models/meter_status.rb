class MeterStatus < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: {message: "数据重复，请确定您的输入!"}
	validates :order_num, numericality: { only_integer: true}
end
