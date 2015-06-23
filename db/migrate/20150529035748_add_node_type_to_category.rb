class AddNodeTypeToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :nodetype, :integer
  end
end
