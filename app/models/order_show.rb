# frozen_string_literal: true

class OrderShow < ApplicationRecord
  belongs_to :order
  belongs_to :product
end
