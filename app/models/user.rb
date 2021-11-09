class User < ApplicationRecord
  has_secure_password
  validates :name, :email, :userRole, presence: true
end
