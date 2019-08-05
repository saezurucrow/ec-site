class Disc < ApplicationRecord

  has_many :songs
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

end
