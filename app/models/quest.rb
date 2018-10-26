class Quest < ApplicationRecord
	belongs_to :location

	validates :name, presence: true
	validates :description, presence: true
end
