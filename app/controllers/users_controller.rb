class UsersController < ApplicationController
    require 'sendgrid-ruby'
    include SendGrid
    skip_before_action :authorized, only: [:create]


    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        from = Email.new(email: 'roy.kimathi@student.moringaschool.com')
        to = Email.new(email: @user.email)
        subject = 'Welcome to Linda Mama'
        content = Content.new(type: 'text/plain', value: @token)
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response
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
