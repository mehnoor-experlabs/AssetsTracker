class CredentialsController < ApplicationController
    before_action :authorize
    before_action :set_credentials

    def index
    end

    private
    def set_credentials
        @credentials = Credential.where(credentiable_type: "User", credentiable_id:current_user.id)
        current_user.assets.each do |asset|
            credential = Credential.where(credentiable_type: "Asset", credentiable_id:asset.id)
            @credentials += credential
        end
    end
end
