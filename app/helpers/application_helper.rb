module ApplicationHelper

  def statuses
    STATUSES.keys
  end
  
  def status_icon(status)
    STATUSES[status]["icon"]
  end

  def status_label(status)
    STATUSES[status]["label"]
  end

  def item_type_icon(type)
    ITEM_TYPES[type]["icon"] 
  end


  private

  STATUSES = {"In Queue" => {"label" => "info", "icon" => "list-ol"},
              "In Progress" => {"label" => "primary", "icon" => "refresh"},
              "Waiting" => {"label" => "warning", "icon" => "spinner"},
              "On Hold" => {"label" => "default", "icon" => "pause"},
              "Cancelled" => {"label" => "danger", "icon" => "times-circle"},
              "Completed" => {"label" => "success", "icon" => "check-circle"}}

  ITEM_TYPES = {"Graphic" => {"icon" => "file-image-o"},
                "Print" => {"icon" => "file-text-o"},
                "Video" => {"icon" => "file-video-o"},
                "Web" => {"icon" => "file-code-o"},
                nil => {"icon" => "file-o"},
                "" => {"icon" => "file-o"}}

end
