class Product < ApplicationRecord

	has_many :cart_item
	attachment :jacket
end
