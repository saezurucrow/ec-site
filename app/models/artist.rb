# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :products

  validates :name, presence: true
end
