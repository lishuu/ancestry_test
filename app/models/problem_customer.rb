class ProblemCustomer < ActiveRecord::Base
	validates :customer_id, :meter_brand_id, :team_id, :troubleshooting_id, presence: true
	belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
	belongs_to :team, class_name: 'Team', foreign_key: 'team_id'
	belongs_to :meter_brand, class_name: 'MeterBrand', foreign_key: 'meter_brand_id'
  belongs_to :code_troubleshooting, class_name: 'CodeTroubleshooting'	, foreign_key: 'troubleshooting_id'
	default_scope -> { order(id: :desc) }

	before_save :update_workorder


private

  def update_workorder
    @team = Team.find(self.team_id)  	
    teamcode = @team.code
	  ActiveRecord::Base.connection.execute("call generate_workoderno('#{teamcode}', 8, @workorderno)")
	  result = ActiveRecord::Base.connection.select_all("select @workorderno")
	  s = result.rows[0][0]
	  self.workorder_no = s
  end

end
