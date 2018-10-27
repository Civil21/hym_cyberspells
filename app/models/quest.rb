class Quest < ApplicationRecord
	has_and_belongs_to_many :players
	
	has_and_belongs_to_many :variants
	
	belongs_to :location

	validates :name, presence: true
	validates :description, presence: true
end
