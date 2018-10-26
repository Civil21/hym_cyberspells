class Variant < ApplicationRecord
	has_one :item
	has_one :exp
	
	validates :text, presence: true
	validates :description, presence: true
end
