module DateHelper
	def print_days_ago (date)
		Date.today > date ? "<font color='#CD3333'><b>due #{time_ago_in_words(date)} ago</b></font>".html_safe : "due in #{time_ago_in_words(date)}".html_safe
	end

	def print_date (dateTime)
		DateTime.now > dateTime ? "<font color='#CD3333'>#{dateTime.strftime("%B %-d, %Y")}</font>".html_safe : "#{dateTime.strftime("%B %-d, %Y")}"
	end

end
