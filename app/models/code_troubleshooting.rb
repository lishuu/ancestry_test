class CodeTroubleshooting < ActiveRecord::Base
	validates :name, :shooting, presence: true
	validates :name, uniqueness: {scope: :trouble_type_id, message: "数据重复，请确定您的输入！"}
	validates :order_num, numericality: { only_integer: true}
	belongs_to :trouble_type, :class_name => "TroubleType", :foreign_key => :trouble_type_id

	def full_name
		return "#{name} | #{shooting}"
	end

	def attributes
		super.merge({'full_name' => full_name})
	end

	def self.full_name_collection
		@cts = CodeTroubleshooting.all
    @cts.all.collect { |u| [u.id, u.full_name]}
    return @cts
	end

end
