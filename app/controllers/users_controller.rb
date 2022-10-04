class UsersController < ApplicationController
    before_action :find_user, only: %i[edit update]
    before_action :authorize, only: %i[edit update]
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            Credential.create(credentiable: @user, password:@user.password)
            session[:user_id] = @user.id
            redirect_to user_assets_url(@user), notice: "User was sucessfully created."
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if allowed
            if @user.update(user_params)
                Credential.create(credentiable: @user, password: @user.password)
                redirect_to user_assets_url(current_user), notice: "Password was successfully changed."
            else
                render 'edit'
            end
        else
            redirect_to root_path, notice: "Illegal action"
        end        
    end
    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end
    def find_user
        @user = User.find(params[:id])
    end
    def allowed
        current_user.id == @user.id
    end
end
