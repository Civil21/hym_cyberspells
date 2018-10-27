class Player < ApplicationRecord
	belongs_to :user
	has_many :items
	has_many :exp
	has_one :location
	has_one :quest
	has_one :variant
	has_one :game_log

	validates :name, presence: true
end
