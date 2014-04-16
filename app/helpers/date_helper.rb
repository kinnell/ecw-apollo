module DateHelper

	def print_date (dT, format)
		if format == "s" then dT.strftime('%-m/%-d/%y')
		elsif format == "m" then dT.strftime("%B %-d, %Y")
		elsif format == "l" then dT.strftime("%A, %B %-d, %Y")
		elsif format == "xl" then dT.in_time_zone('Eastern Time (US & Canada)').strftime("%B %-d, %Y at %l:%M %p")
		end
	end

	def print_time_ago (dT)
		if dT < DateTime.now then "<div class='late'>due #{time_ago_in_words(dT)} ago</div>".html_safe
		else "due in #{time_ago_in_words(dT)}".html_safe
		end
end


end
