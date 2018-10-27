class Item < ApplicationRecord
	belongs_to :variant
	
	validates :name, presence: true
end
