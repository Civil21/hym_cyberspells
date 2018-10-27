class Exp < ApplicationRecord
	belongs_to :variant
	has_and_belongs_to_many :players
	validates :name, presence: true
end
