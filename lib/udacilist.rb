class UdaciList
  attr_reader :items
  attr_accessor :title

  def initialize(title = "Untitled List")
    @title = :title
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    if type == "todo"
      @items.push TodoItem.new(description, options)
    elsif type == "event"
      @items.push EventItem.new(description, options)
    elsif type == "link"
      @items.push LinkItem.new(description, options)
    else 
      raise UdaciListErrors::InvalidItemError, "This is not a valid item type"
    end
  end

  def filter(type)
    if type.downcase == "event"
      puts EventItem::event_items.to_s
    elsif type.downcase == "todo"
      puts TodoItem::todo_items.to_s
    elsif type.downcase == "link"
      puts LinkItem::link_items.to_s 
    end     
  end

  def delete(index)
    if @items.length >= index
      @items.delete_at(index - 1)
    else
      raise UdaciListErrors::IndexExceedsListSize, "This item does not exist"
    end
  end

  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    rows = []
    @items.each_with_index do |item, position|
      rows << [position +1 , item.details]
    end
    table = Terminal::Table.new :rows => rows
    puts table
  end
end
