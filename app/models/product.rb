# frozen_string_literal: true

class Product < ApplicationRecord
  attachment :jacket

  has_many :cart_items
  has_many :discs
  has_many :orders, through: :order_shows
  has_many :order_shows

  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

  belongs_to :artist
  belongs_to :label
  belongs_to :genre

  enum product_status: %i[販売中 販売停止中]

  validates :name, presence: true
  validates :price, presence: true
  validates :artist_id, presence: true
  validates :label_id, presence: true
  validates :genre_id, presence: true
  validates :stock, presence: true
  validates :product_status, presence: true
end
