class Author < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  has_many :gossips
  has_secure_password
end
