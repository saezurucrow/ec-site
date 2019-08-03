class Product < ApplicationRecord

  attachment :jacket

  belongs_to :artist
  belongs_to :label
  belongs_to :genre

  enum product_status:[:販売中, :販売停止中]
end
