class Item < ApplicationRecord
	has_and_belongs_to_many :players
	
	validates :name, presence: true

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
