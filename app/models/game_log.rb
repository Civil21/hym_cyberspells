class GameLog < ApplicationRecord
	has_many :locations
	belongs_to :player
end
