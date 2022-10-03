class AssetsController < ApplicationController
    before_action :authorize, only: %i[index new create edit update destroy]
    before_action :current_user
    before_action :set_asset, only: %i[ show edit update destroy assign]
    before_action :allowed, only: %i[update destroy assign]

    def index
        @assets = current_user.assets
    end
    def show
    end
    def new
        @asset = current_user.assets.build
    end
    def create
        @asset = current_user.assets.build(asset_params.merge(:assigned_at => Date.today))
        if @asset.save
            redirect_to user_assets_url(current_user), notice: asset_params.inspect
        else
            render 'new'
        end
    end
    def edit 
    end
    def update 
        if allowed
            if @asset.update(asset_params)
                redirect_to user_asset_url(current_user), notice: "Asset was successfully updated."
            else
                render 'edit'
            end
        else
            redirect_to user_assets_url(current_user), notice: "Illegal action"
        end
    end
    def destroy
        if allowed
            @asset.destroy

            redirect_to user_assets_url(current_user), notice: "Asset was successfully deleted."
        else
            redirect_to user_assets_url(current_user), notice: "Illegal action"
        end
    end
    def assign
    end
    def transfer
        @asset = Asset.find(assign_params[:id])
        @asset.update_attribute(:assigned_at, Date.today)
        user = User.find_by_username(assign_params[:user_id])
        if allowed            
            user.assets << @asset
            redirect_to user_assets_url(current_user), notice: "Asset has been successfuly transferred to #{user.username}"
        end
    end
    private
    def set_asset
        @asset = Asset.find(params[:id])
    end
    def allowed
        @asset.user_id == current_user.id
    end
    def asset_params
        params.require(:asset).permit(:name, :description, :purchase_date, :purchased_from, :serial_number, :purchase_type, :condition_score)
    end
    def assign_params
        params.require(:asset).permit(:user_id, :id)
    end
end
