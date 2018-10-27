class Player < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :items
	has_and_belongs_to_many :exps
	has_and_belongs_to_many :quest
	has_and_belongs_to_many :location
	has_and_belongs_to_many :variant
	has_one :game_log

	validates :name, presence: true
end
