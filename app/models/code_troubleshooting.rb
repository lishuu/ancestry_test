class CodeTroubleshooting < ActiveRecord::Base
	validates :name, :code, :shooting, presence: true
	validates :name, uniqueness: {scope: :trouble_type_id, message: "数据重复，请确定您的输入！"}
	validates :code, uniqueness: {message: "数据重复，请确定您的输入！"}
	validates :order_num, numericality: { only_integer: true}
	belongs_to :trouble_type, :class_name => "TroubleType", :foreign_key => :trouble_type_id

end
