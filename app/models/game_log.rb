class GameLog < ApplicationRecord
	has_and_belongs_to_many :locations
	belongs_to :player

	def p(text)
		test_text
		self.text ="<p>"+text.to_s+"</p>"+self.text
	end

	def b(text)
		test_text
		self.text ="<b>"+text.to_s+"</b>"+self.text
	end
	def h1(text)
		test_text
		self.text ="<h1>"+text.to_s+"</h1>"+self.text
	end

	def h2(text)
		test_text
		self.text ="<h2>"+text.to_s+"</h2>"+self.text
	end

	def h3(text)
		test_text
		self.text ="<h3>"+text.to_s+"</h3>"+self.text
	end

	def h4(text)
		test_text
		self.text ="<h4>"+text.to_s+"</h4>"+self.text
	end


	def h5(text)
		test_text
		self.text ="<h5>"+text.to_s+"</h5>"+self.text
	end

	private 

	def test_text
		if(!self.text) 
			self.text = self.text.to_s  
		end
	end
end
