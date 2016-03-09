class NoteItem
	include Listable 
	attr_reader :description

	@@note_items = []

	def initialize(description)
		@description = description
		@@note_items << self
	end

	def self.note_items
		unless @@note_items == 0
			@@note_items
		else 
			puts "There are no notes in this list"
		end
	end

	def details
       "Note - " + format_description(@description)
   end
end