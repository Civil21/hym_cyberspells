class Variant < ApplicationRecord
	has_and_belongs_to_many :player
	has_one :item
	has_one :exp
	
	validates :text, presence: true
	validates :description, presence: true
end
