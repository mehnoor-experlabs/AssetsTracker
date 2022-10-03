class CommentsController < ApplicationController
    before_action :current_user, :find_asset
    before_action :authorize, only: %i[create destroy]
    before_action :find_comment, only: %i[destroy]
    before_action :allowed, only: %i[destroy]

    def create
        @comment = @asset.comments.create(comment_params.merge(:commenter => current_user.username))
        redirect_to user_asset_url(@asset.user_id, @asset.id)
    end
    def destroy
        if allowed
            @comment.destroy
        end
        redirect_to user_asset_url(@asset.user_id, @asset.id)
    end
    private
    def comment_params
        params.require(:comment).permit(:body)
    end
    def find_comment
        @comment = @asset.comments.find(params[:id])
    end
    def find_asset
        @asset = Asset.find(params[:asset_id])
    end
    def allowed
        @comment.commenter == current_user.username || current_user.id == @asset.user_id
    end
end
