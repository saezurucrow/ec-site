class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_shows
  has_many :address

  enum payment: [:銀行振込, :クレジットカード, :代引]

end
