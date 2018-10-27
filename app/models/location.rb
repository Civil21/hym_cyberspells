class Location < ApplicationRecord
	has_many :quests
	has_and_belongs_to_many :players

	validates :name, presence: true
	validates :description, presence: true
end
