class Credential < ApplicationRecord
    belongs_to :credentiable, polymorphic: true
end
