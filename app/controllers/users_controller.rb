class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :unprocessable_entity
      end
    end
    def create_profile
      user = find_user
      profile = user.profile.create(profile_params)
      render json: profile, include: :user
    end
    def profile
      user = find_user
      profile = user.profile
      render json: profile, include: user
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end
    def find_user
      User.find(params[:id])
    end
    def profile_params
      params.permit(:first_name, :last_name, :avatar, :bio, :age, :sex)
    end
end
