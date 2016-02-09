class LinkItem
  include Listable
  attr_reader :description, :site_name

  @@link_items = []

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
    @@link_items << self
  end

  def self.link_items
    unless @@link_items == 0
      @@link_items
    else
      puts "There are no items of this type"
    end
  end

  def format_name
    @site_name ? @site_name : ""
  end
  def details
    "Link - " + format_description(@description) + "site name: " + format_name
  end
end
