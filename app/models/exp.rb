class Exp < ApplicationRecord
	belongs_to :variant

	validates :name, presence: true
end
