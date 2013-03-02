module HomeHelper
	def sortable(column,action, title = nil)
		title ||= column.titleize

		if(params[:column])
			sort_column = params[:column]
		else
			sort_column = defaultColumn
		end

		if(params[:direction])
			sort_direction = params[:direction]
		else
			sort_direction = defaultSortOrder
		end

 		css_class = column == sort_column ? "current_sorted #{sort_direction}" : nil
  		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, {:controller => "home", :action => action,:column => column, :direction => direction, :page => nil}, {:class => css_class,:method=>'GET',:remote=>true}
	end
end
