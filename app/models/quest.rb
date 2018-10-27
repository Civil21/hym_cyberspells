class Quest < ApplicationRecord
	belongs_to :location
	has_and_belongs_to_many :players

	validates :name, presence: true
	validates :description, presence: true
end
