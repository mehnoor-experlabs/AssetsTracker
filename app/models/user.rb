class User < ApplicationRecord
    has_many :assets, dependent: :destroy
    has_many :credentials, as: :credentiable
    validates :password, confirmation: true
    validates :name, :username, :password, :password_confirmation, presence: true
    validates :username, uniqueness: true
    has_secure_password
end
