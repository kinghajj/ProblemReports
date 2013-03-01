class Notification

	@ticket
	@histories
	@most_recent_date_time

	def ticket
		@ticket
	end

	def histories
		@histories
	end

	def most_recent_date_time
		@most_recent_date_time
	end

	def ticket=(ticket)
		@ticket = ticket
	end

	def histories=(histories)
		@histories = histories
	end

	def most_recent_date_time=(most_recent_date_time)
		@most_recent_date_time = most_recent_date_time
	end

	def initialize histories
		self.ticket = histories[0].problem_report_record
		self.histories = histories

		most_recent =histories[0].created_at

		histories.each do |hist|
			 if hist.created_at > most_recent 
			 	most_recent = hist.created_at 
			 end
		end

		self.most_recent_date_time = most_recent
	end

	def self.buildNotifications histories
		historyMap = Hash.new

		histories.each do |hist|
			currentArray = historyMap[hist.problem_report_record_id]

			if(currentArray.nil?)
				currentArray = Array.new
			end

			currentArray.push(hist)
			historyMap[hist.problem_report_record_id] = currentArray
		end

		notifications = Array.new

		historyMap.each_pair do |k,v|

			if(v.size > 0)
				notifications.push(Notification.new v)
			end

		end

		notifications

	end 



end