class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_shows
  belongs_to :address

  has_many :products, through: :order_shows

  enum payment: [:銀行振込, :クレジットカード, :代引]
  enum order_status: [:受理待ち,:発送中,:お届け済み]

end
