class Product < ApplicationRecord

  attachment :jacket

  has_many :discs
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

  belongs_to :artist
  belongs_to :label
  belongs_to :genre

  enum product_status:[:販売中, :販売停止中]
end
