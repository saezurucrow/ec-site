# frozen_string_literal: true

class Song < ApplicationRecord
  validates :name, presence: true
end
