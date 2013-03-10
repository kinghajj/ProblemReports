class AddSignatureToUser < ActiveRecord::Migration
  def up
  	add_column :users, :email_signature, :string
  end

  def down
  	remove_column :users, :email_signature
  end
end