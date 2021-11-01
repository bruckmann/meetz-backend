class User < ApplicationRecord
  has_secure_password
  validates :name, :password, :email, :userRole, presence: true
end
