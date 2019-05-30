class Product < ApplicationRecord

	has_many :cart_item
	attachment :jacket

	accepts_nested_attributes_for :music, allow_destroy: true

end
