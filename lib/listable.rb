module Listable
  def format_description(description)
    "#{description}".ljust(25)
  end

  def format_date(start_date, end_date = false)
    dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime("%D") if end_date
    dates = "N/A" if !dates
    return dates
  end

  def format_priority(priority)
  	if priority == "high"
  		value = " ⇧".colorize(:red)
    elsif priority == "medium"
    	value = " ⇨".colorize(:yellow)
    elsif priority == "low"
    	value = " ⇩".colorize(:green)
    elsif !priority
     	value = ""
    end
  end
end
