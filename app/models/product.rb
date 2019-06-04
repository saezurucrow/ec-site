class Product < ApplicationRecord

	has_many :cart_item
	has_many :musics
	attachment :jacket

	accepts_nested_attributes_for :musics, allow_destroy: true

end
