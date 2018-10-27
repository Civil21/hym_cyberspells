class Location < ApplicationRecord
	has_many :quests

	validates :name, presence: true
	validates :description, presence: true
end
