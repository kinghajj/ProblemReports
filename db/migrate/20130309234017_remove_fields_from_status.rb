class RemoveFieldsFromStatus < ActiveRecord::Migration
  def up
  	remove_column :statuses, :uninitialized
  	rename_column :statuses, :initialized, :first_status
  end

  def down
  	add_column :statuses, :uninitialized, :boolean
  	rename_column :statuses, :first_status,:initialized
  end
end
