class AddOwnerIdToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :owner_id, :integer
  end
end
