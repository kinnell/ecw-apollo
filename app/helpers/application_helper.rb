module ApplicationHelper

	def status_hash
		status_hash = {"In Queue" => {"type" => "info", "icon" => "list-ol"},
                    "In Progress" => {"type" => "primary", "icon" => "refresh"},
                    "Waiting" => {"type" => "warning", "icon" => "spinner"},
                    "On Hold" => {"type" => "default", "icon" => "pause"},
                    "Cancelled" => {"type" => "danger", "icon" => "times-circle"},
                    "Completed" => {"type" => "success", "icon" => "check-circle"}}
	end

	def item_type_hash
		item_type_hash = {"Graphic" => {"icon" => "file-image-o"},
                    "Print" => {"icon" => "file-text-o"},
                    "Video" => {"icon" => "file-video-o"},
                    "Web" => {"icon" => "file-code-o"},
                 		nil => {"icon" => "file-o"},
                    "" => {"icon" => "file-o"}}
	end

end
