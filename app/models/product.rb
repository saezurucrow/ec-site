class Product < ApplicationRecord

  attachment :jacket

  belongs_to :artist
  belongs_to :label
  belongs_to :genre
end
