module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "error"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "notice"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def active_class(link_path)
    if params[:controller] == link_path
      return 'active'
    end 
  end

  def active_action(link_path)
    if params[:action] == link_path
      return 'active'
    end 
  end
end
