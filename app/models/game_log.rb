class GameLog < ApplicationRecord
	has_and_belongs_to_many :locations
	belongs_to :player

	def p(text)
		if(!self.text) 
			self.text = self.text.to_s  
		end
		self.text +="<p>"+text.to_s+"</p>"
	end

	def b(text)
		if(!self.text) 
			self.text = self.text.to_s  
		end
		self.text +="<b>"+text.to_s+"</b>"
	end
end
