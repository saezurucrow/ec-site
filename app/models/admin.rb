class Admin < ApplicationRecord
  has_secure_password validations: true

  validates :mail, presence: true, uniqueness: true
end
