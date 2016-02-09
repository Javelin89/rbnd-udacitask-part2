class TodoItem
  include Listable
  attr_reader :description, :due
  attr_accessor :priority

  @@todo_items = []

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    priority_validity
    @@todo_items << self
  end

  def self.todo_items
    unless @@todo_items == 0
      @@todo_items
    else
      puts "There are no items of this type"
    end
  end

  def details
    "Todo - " +
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