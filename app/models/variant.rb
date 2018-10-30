class Variant < ApplicationRecord
	has_and_belongs_to_many :players
	has_and_belongs_to_many :quests
	has_and_belongs_to_many :player
	has_and_belongs_to_many :quest

	#belongs_to :item
	#belongs_to :exp
	
	validates :text, presence: true
	validates :description, presence: true
end
