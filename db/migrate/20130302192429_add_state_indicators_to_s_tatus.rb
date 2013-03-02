class AddStateIndicatorsToSTatus < ActiveRecord::Migration
  def up
  	add_column :statuses, :uninitialized, :boolean
  	add_column :statuses, :initialized, :boolean
  	add_column :statuses, :complete, :boolean
  end

  def down
	remove_column :statuses, :uninitialized
  	remove_column :statuses, :initialized
  	remove_column :statuses, :complete
  end
end
