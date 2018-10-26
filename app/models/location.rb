class Location < ApplicationRecord
	has_many :questions

	validates :name, presence: true
	validates :description, presence: true
end
