# config/initializers/cloudinary.rb

Rails.application.configure do 

    Cloudinary.config do |config|

        config.cloud_name = 'dtnohzfmg'
        config.api_key = 756216484595116
        config.api_secret = 'q6t9wgLO7njG7Jye6GRB4dFwYaM'
        config.secure = true # Ensure secure URLs
    end
  
end  