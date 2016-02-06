class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    priority_validity
  end

  def details
    format_description(@description) + "due: " +
    format_date(@due) +
    format_priority(@priority)
  end

  def priority_validity
    unless priority == "high" || priority == "medium" || priority == "low" || !priority 
      raise UdaciListErrors::InvalidPriorityValue
    end
  end
end