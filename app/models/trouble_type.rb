class TroubleType < ActiveRecord::Base
	has_many :code_troubleshootings
end
