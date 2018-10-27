class Player < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :items
	has_and_belongs_to_many :exps
	has_and_belongs_to_many :quests
	has_and_belongs_to_many :locations
	has_and_belongs_to_many :variants
	has_one :game_log

	validates :name, presence: true
end
