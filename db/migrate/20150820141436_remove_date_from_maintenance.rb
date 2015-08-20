class RemoveDateFromMaintenance < ActiveRecord::Migration
  def change
    remove_column :maintenances, :date, :string
  end
end
