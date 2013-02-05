class ChangeCategoryIdColumnName < ActiveRecord::Migration
  def up
  	rename_column :problem_report_records , :catagory_id , :category_id
  end

  def down
  	rename_column :problem_report_records , :category_id , :catagory_id
  end
end
