class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
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
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
