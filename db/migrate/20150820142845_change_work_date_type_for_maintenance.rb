class ChangeWorkDateTypeForMaintenance < ActiveRecord::Migration
  def change
    change_table :maintenances do |t|
      t.change :work_date, :date
    end
  end
end
