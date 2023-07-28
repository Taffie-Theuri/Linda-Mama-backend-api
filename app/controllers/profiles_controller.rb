class ProfilesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        profile = Profile.create(profile_params)
        render json: profile, status: :created
    end
    def update
        profile = find_profile
        profile.update(profile_params)
        render json: profile
    end


    private
    def profile_params
        params.permit(:first_name, :last_name, :avatar, :bio, :age, :sex)
    end
    def find_profile
        Profile.find(params[:id])
    end
end
