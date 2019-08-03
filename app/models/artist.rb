class Artist < ApplicationRecord

  has_many :products
  accepts_nested_attributes_for :products
end
