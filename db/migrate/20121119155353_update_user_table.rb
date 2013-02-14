class UpdateUserTable < ActiveRecord::Migration
  def change
    change_column :users, :lock_version, :integer, :null => false, :default => 0
  end
end
