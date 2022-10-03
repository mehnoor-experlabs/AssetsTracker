class User < ApplicationRecord
    has_many :assets
    validates :password, confirmation: true
    validates :name, :username, :password, :password_confirmation, presence: true
    validates :username, uniqueness: true
    has_secure_password
end
