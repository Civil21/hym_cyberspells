class VariantNext < ApplicationRecord
	def findVariants(object)
		return Variant.find(VariantNext.where(variant_id: Variant.find(object.variant.ids).first).map{|p| p = p.next}.to_a)
	end
end
