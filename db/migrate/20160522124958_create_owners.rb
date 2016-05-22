class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :ownername
      t.string :email
      t.timestamps
    end
  end
end
