class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date

  @@event_items = []

  def initialize(description, options={})
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
    @@event_items << self
  end

  def self.event_items
    unless @@event_items == 0
      @@event_items
    else
      puts "There are no items of this type"
    end
  end

  def details
    "Event - " + format_description(@description) + "event dates: " + format_date(@start_date, @end_date)
  end
end
