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

  # Return "active" if its the current controller
  def active_class(link_path)
    if params[:controller] == link_path
      return 'active'
    end 
  end

  # Return "active" if its the current action
  def active_action(link_path)
    if params[:action] == link_path
      return 'active'
    end 
  end

  # Helper to show pretty number
  def format_number(a_number)
    number_with_delimiter(number_with_precision(a_number, precision: 0, strip_insignificant_zeros: true), :delimiter => ".", :separator => ",")
  end

  def icon_action(an_action)
    if an_action == "new"
      return "check"
    elsif an_action = "edit"
      return "save"
    end 
  end
end
