class SetUpAttachment < ActiveRecord::Migration
  def up
  	add_column :attachments, :file_file_name, :string
    add_column :attachments, :file_content_type, :string
    add_column :attachments, :file_file_size, :integer
  end

  def down
  	remove_column :attachments, :file_file_name
    remove_column :attachments, :file_content_type
    remove_column :attachments, :file_file_size
  end
end
