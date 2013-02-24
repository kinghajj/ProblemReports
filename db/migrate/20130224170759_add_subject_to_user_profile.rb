class AddSubjectToUserProfile < ActiveRecord::Migration
  def up
  	add_column :users , :show_subject , :boolean
  end
  def down
  	remove_column :users, :show_subject
  end

end
