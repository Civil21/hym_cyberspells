class Player < ApplicationRecord
	belongs_to :user
	has_many :items
	has_many :exp
	has_many :locations
	has_one :quest
	has_one :variant

	validates :name, presence: true
end
