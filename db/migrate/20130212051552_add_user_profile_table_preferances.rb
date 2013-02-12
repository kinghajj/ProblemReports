class AddUserProfileTablePreferances < ActiveRecord::Migration
  def up
  	add_column :users , :show_description , :boolean
  	add_column :users , :show_catagory , :boolean
  	add_column :users , :show_priority , :boolean
  	add_column :users , :show_date_entered , :boolean
  	add_column :users , :show_date_completed , :boolean
  	add_column :users , :show_due_date , :boolean
  	add_column :users , :show_hours_worked , :boolean
  	add_column :users , :show_system_type , :boolean
  	add_column :users , :show_escalation , :boolean
  	add_column :users , :show_problem_type , :boolean
  	add_column :users , :show_room_building , :boolean
  	add_column :users , :show_room_number , :boolean
  	add_column :users , :show_computer_name , :boolean
  	add_column :users , :show_solution , :boolean
  	add_column :users , :show_status , :boolean
  	add_column :users , :show_submitted_by , :boolean
  	add_column :users , :show_completed_by , :boolean
  	add_column :users , :show_submitters_name , :boolean
  	add_column :users , :show_submitters_email , :boolean
  end

  def down
  	remove_column :users , :show_description
  	remove_column :users , :show_catagory
  	remove_column :users , :show_priority
  	remove_column :users , :show_date_entered
  	remove_column :users , :show_date_completed
  	remove_column :users , :show_due_date
  	remove_column :users , :show_hours_worked
  	remove_column :users , :show_system_type
  	remove_column :users , :show_escalation
  	remove_column :users , :show_problem_type
  	remove_column :users , :show_room_building
  	remove_column :users , :show_room_number 
  	remove_column :users , :show_computer_name
  	remove_column :users , :show_solution
  	remove_column :users , :show_status
  	remove_column :users , :show_submitted_by
  	remove_column :users , :show_completed_by
  	remove_column :users , :show_submitters_name
  	remove_column :users , :show_submitters_email
  end
end
