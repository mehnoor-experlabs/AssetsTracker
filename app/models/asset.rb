class Asset < ApplicationRecord
    belongs_to :user
    has_many :credentials, as: :credentiable
    has_many :comments, dependent: :destroy
    validates :name, :password, presence: true
end
